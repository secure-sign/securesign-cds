/*
 * Copyright (C) 2019 Open Whisper Systems
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

 /**
  * @author Jeff Griffin
  */
#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <x86intrin.h>

#include "sabd-enclave.h"
#include "sgxsd-enclave.h"
#include "sabd_enclave_t.h"

#include "sgx_trts.h"
#include "sgx_lfence.h"

#if UNIT_TESTING
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include "cmockery.h"
#include "test_memset_s.h"
#endif

//
// sgxsd callbacks
//

typedef struct sabd_msg {
  sgxsd_msg_from_t from;
  uint32_t ab_phone_count;
  struct sabd_msg *prev;
} sabd_msg_t;

typedef struct sgxsd_server_state {
  sabd_msg_t *msgs;
  uint32_t ab_phone_count;
  uint32_t max_ab_phones;
  phone_t *p_ab_phones;
  uint8_t *p_result_data;
} sgxsd_server_state_t, sabd_state_t;

static const size_t sabd_result_data_stride = 1 + sizeof(uuid_t);

sgx_status_t sgxsd_enclave_server_init(const sabd_start_args_t *p_args, sabd_state_t **pp_state) {
  if (p_args == NULL) {
    return SGX_ERROR_INVALID_PARAMETER;
  }

  sabd_state_t *p_state = malloc(sizeof(sabd_state_t));

  _Static_assert(p_args->max_ab_phones < SIZE_MAX / sizeof(phone_t), "size_t overflow");
  size_t ab_phones_size = p_args->max_ab_phones * sizeof(phone_t);
  phone_t *p_ab_phones = memalign(SABD_CACHE_LINE_SIZE, ab_phones_size);

  _Static_assert(p_args->max_ab_phones < SIZE_MAX / sabd_result_data_stride, "size_t overflow");
  size_t result_data_size = p_args->max_ab_phones * sabd_result_data_stride;
  uint8_t *p_result_data = malloc(result_data_size);
  if (p_state == NULL || p_ab_phones == NULL || p_result_data == NULL) {
    free(p_state);
    free(p_ab_phones);
    free(p_result_data);
    return SGX_ERROR_OUT_OF_MEMORY;
  }
  memset_s(p_state, sizeof(sabd_state_t), 0, sizeof(sabd_state_t));
  memset_s(p_ab_phones, ab_phones_size, 0, ab_phones_size);
  memset_s(p_result_data, result_data_size, 0, result_data_size);
  *p_state = (sabd_state_t) {
    .msgs = NULL,
    .ab_phone_count = 0,
    .max_ab_phones = p_args->max_ab_phones,
    .p_ab_phones = p_ab_phones,
    .p_result_data = p_result_data,
  };
  *pp_state = p_state;
  return SGX_SUCCESS;
}
sgx_status_t sgxsd_enclave_server_handle_call(const sabd_call_args_t *p_args,
                                              sgxsd_msg_buf_t msg, sgxsd_msg_from_t from,
                                              sabd_state_t **pp_state) {
  sabd_state_t *p_state = *pp_state;
  if (p_state == NULL) {
    return SGX_ERROR_INVALID_STATE;
  }
  if (p_args == NULL) {
    return SGX_ERROR_INVALID_PARAMETER;
  }
  uint32_t bytes_per_ab_phone = sizeof(phone_t) + sizeof(sabd_ratelimit_nonce_t);
  if (p_args->ab_phone_count == 0 ||
      p_args->ab_phone_count > p_state->max_ab_phones - p_state->ab_phone_count) {
    return SGX_ERROR_INVALID_PARAMETER;
  }
  if (msg.size % bytes_per_ab_phone != 0 ||
      msg.size / bytes_per_ab_phone != p_args->ab_phone_count) {
    return SABD_ERROR_INVALID_REQUEST_SIZE;
  }
  sgx_lfence();

  uint32_t state_ab_phone_idx = p_state->ab_phone_count;
  uint32_t msg_phones_size = p_args->ab_phone_count * sizeof(phone_t);
  phone_t *p_msg_phones = (void *) &msg.data[0];
  sabd_ratelimit_nonce_t *p_msg_nonces = (void *) &msg.data[msg_phones_size];

  if (p_args->p_ratelimit_set != NULL) {
    size_t ratelimit_set_size = sizeof(*p_args->p_ratelimit_set) + p_args->ratelimit_set_slot_count * sizeof(p_args->p_ratelimit_set->slots[0]);
    _Static_assert(p_args->ratelimit_set_slot_count < (SIZE_MAX - sizeof(*p_args->p_ratelimit_set)) / sizeof(p_args->p_ratelimit_set->slots[0]), "size_t overflow");
    if (sgx_is_outside_enclave(p_args->p_ratelimit_set, ratelimit_set_size) != 1) {
      return SGX_ERROR_INVALID_PARAMETER;
    }
    sgx_lfence();

    sabd_ratelimit_set_t *p_ratelimit_set = malloc(ratelimit_set_size);
    if (p_ratelimit_set == NULL) {
      return SGX_ERROR_OUT_OF_MEMORY;
    }
    memcpy(p_ratelimit_set, p_args->p_ratelimit_set, ratelimit_set_size);

    sabd_ratelimit(p_ratelimit_set, p_args->ratelimit_set_slot_count, p_msg_phones, p_msg_nonces, &p_state->p_result_data[state_ab_phone_idx * sabd_result_data_stride], p_args->ab_phone_count);

    memcpy(p_args->p_ratelimit_set, p_ratelimit_set, ratelimit_set_size);
    free(p_ratelimit_set);
  }

  sabd_msg_t *p_sabd_msg = malloc(sizeof(sabd_msg_t));
  if (p_sabd_msg == NULL) {
    return SGX_ERROR_OUT_OF_MEMORY;
  }
  *p_sabd_msg = (sabd_msg_t) {
    .from = from,
    .prev = p_state->msgs,
    .ab_phone_count = p_args->ab_phone_count,
  };
  p_state->msgs = p_sabd_msg;
  memcpy(&p_state->p_ab_phones[state_ab_phone_idx], p_msg_phones, msg_phones_size);
  p_state->ab_phone_count += p_sabd_msg->ab_phone_count;

  memset_s(&from, sizeof(from), 0, sizeof(from));

  return SGX_SUCCESS;
}
sgx_status_t sgxsd_enclave_server_terminate(const sabd_stop_args_t *p_args, sabd_state_t *p_state) {
  if (p_state == NULL) {
    return SGX_ERROR_INVALID_STATE;
  }

  sgx_status_t validate_args_res = SGX_ERROR_INVALID_PARAMETER;
  size_t validated_in_phone_count = 0;
  if (p_args == NULL) {
    validate_args_res = SGX_ERROR_INVALID_PARAMETER;
  } else {
    // make sure in_phones is outside of the enclave
    size_t in_phones_size = p_args->in_phone_count * sizeof(p_args->in_phones[0]);
    size_t in_uuids_size = p_args->in_phone_count * sizeof(p_args->in_uuids[0]);
    if (p_args->in_phone_count > SIZE_MAX / sizeof(p_args->in_phones[0]) ||
        p_args->in_phone_count > SIZE_MAX / sizeof(p_args->in_uuids[0]) ||
        sgx_is_outside_enclave(p_args->in_phones, in_phones_size) != 1 ||
        sgx_is_outside_enclave(p_args->in_uuids, in_uuids_size) != 1) {
      validate_args_res = SGX_ERROR_INVALID_PARAMETER;
    } else {
      validated_in_phone_count = in_phones_size / sizeof(p_args->in_phones[0]);
      validate_args_res = SGX_SUCCESS;
    }
  }

  sgx_status_t lookup_res;
  sgx_status_t replies_res = SGX_SUCCESS;
  if (p_state->ab_phone_count != 0) {
    uuid_t *in_ab_phones_result = malloc(p_state->ab_phone_count * sizeof(uuid_t));
    _Static_assert(p_state->ab_phone_count < SIZE_MAX / sizeof(uuid_t), "size_t overflow");
    if (validate_args_res != SGX_SUCCESS) {
      // failed to validate lookup args
      lookup_res = validate_args_res;
    } else if (in_ab_phones_result != NULL) {
      // prevent speculative execution in case in_phones lies inside enclave
      sgx_lfence();

      lookup_res = sabd_lookup_hash(p_args->in_phones, p_args->in_uuids, validated_in_phone_count,
                                    p_state->p_ab_phones, p_state->ab_phone_count,
                                    in_ab_phones_result);
    } else {
      lookup_res = SGX_ERROR_OUT_OF_MEMORY;
    }

    uint32_t ab_phone_idx = p_state->ab_phone_count;
    for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
      if (lookup_res == SGX_SUCCESS) {
        ab_phone_idx -= p_msg->ab_phone_count;
        sgxsd_msg_buf_t reply_buf = {
          .data = &p_state->p_result_data[ab_phone_idx * sabd_result_data_stride],
          .size = p_msg->ab_phone_count * sabd_result_data_stride,
        };
        memcpy(&reply_buf.data[p_msg->ab_phone_count * 1],
               (uint8_t *) &in_ab_phones_result[ab_phone_idx],
               p_msg->ab_phone_count * sizeof(in_ab_phones_result[0]));
        // sgxsd_enclave_server_reply overwrites reply_buf.data
        sgx_status_t reply_res = sgxsd_enclave_server_reply(reply_buf, p_msg->from);
        if (replies_res == SGX_SUCCESS) {
          replies_res = reply_res;
        }
      }

      sabd_msg_t *p_prev_msg = p_msg->prev;
      memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
      free(p_msg);
      p_msg = p_prev_msg;
    }

    free(in_ab_phones_result);
  } else {
    lookup_res = validate_args_res;
  }

  size_t ab_phones_size = p_state->max_ab_phones * sizeof(p_state->p_ab_phones[0]);
  memset_s(p_state->p_ab_phones, ab_phones_size, 0, ab_phones_size);
  free(p_state->p_result_data);
  free(p_state->p_ab_phones);
  free(p_state);
  if (lookup_res == SGX_SUCCESS) {
    if (replies_res == SGX_ERROR_INVALID_PARAMETER) {
      return SGX_ERROR_UNEXPECTED;
    }
    return replies_res;
  } else {
    return lookup_res;
  }
}

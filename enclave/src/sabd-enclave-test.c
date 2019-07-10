/*
 * Copyright (C) 2017 Open Whisper Systems
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
#include <string.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <stdint.h>
#include <time.h>

#include "sgx_trts.h"

#include "sabd.h"
#include "sgxsd-enclave.h"

#include "cmockery.h"

bool benchmark;
#define BENCHMARK_IN_PHONE_COUNT_STEPS 3
#define BENCHMARK_AB_PHONE_COUNT_STEPS 3
#define BENCHMARK_TEST_RUN_COUNT     2

uint32_t test_run_count = 4;

long int test_drand48_seed;
struct drand48_data test_drand48_data;

sgxsd_server_state_t *p_server_state;
sabd_start_args_t *p_empty_start_args;
sgxsd_msg_buf_t valid_msg_buf;
sgxsd_msg_buf_t valid_reply;
sgxsd_msg_from_t dummy_msg_from;
sabd_call_args_t *p_valid_call_args;
sabd_stop_args_t *p_empty_stop_args;
sabd_stop_args_t *p_valid_stop_args;

phone_t *test_in_phones;
uuid_t *test_in_uuids;
const size_t test_in_phone_count = 1000*1000;
uint32_t benchmark_in_phone_count_steps = 0;
size_t test_in_phone_count_step_factor = 10;

phone_t *test_ab_phones;
const uint32_t test_ab_phone_count = 2048;
uint32_t benchmark_ab_phone_count_steps = 0;
uint32_t test_ab_phone_count_step_factor = 2;

uuid_t *test_expected_in_ab_phones_result;

uint32_t test_hash_table_overflow_ab_phone_count   = 16;
// check overflow rate < 1 / 1e6 = 0.0001%
uint32_t test_hash_table_overflow_max_count      = 0;
uint32_t test_hash_table_overflow_run_count      = 1e6;
// in benchmark mode, check overflow rate < 1 / 1e6 = 0.0001%
uint32_t benchmark_hash_table_overflow_run_count = 1e7;

extern unsigned long long test_total_tsc;

void setup_sabd_lookup_test(size_t in_phone_count, phone_t *ab_phones, uint32_t ab_phone_count, uuid_t *expected_in_ab_phones_result) {
  for (uint32_t ab_phone_idx = 0; ab_phone_idx < ab_phone_count; ab_phone_idx++) {
    long int rand;
    mrand48_r(&test_drand48_data, &rand);
    uint32_t rand_idx = rand % (in_phone_count * 2);
    if (rand_idx < in_phone_count) {
      ab_phones[ab_phone_idx] = test_in_phones[rand_idx];
      expected_in_ab_phones_result[ab_phone_idx] = test_in_uuids[rand_idx];
    } else {
      ab_phones[ab_phone_idx] = 1;
      expected_in_ab_phones_result[ab_phone_idx] = (uuid_t) { .data64 = {0, 0} };
    }
  }
}

static inline uint64_t test_rand64() {
  long int rand;
  mrand48_r(&test_drand48_data, &rand);
  uint64_t lower = rand & UINT32_MAX;
  mrand48_r(&test_drand48_data, &rand);
  return lower | ((long unsigned int) rand) << 32;
}

void setup_tests(void **state) {
  print_message("using seed: 0x%08lx\n", test_drand48_seed);
  srand48_r(test_drand48_seed, &test_drand48_data);

  size_t max_in_phone_count = test_in_phone_count;
  if (benchmark) {
    benchmark_in_phone_count_steps = BENCHMARK_IN_PHONE_COUNT_STEPS;
  }
  for (uint32_t in_phone_count_step = 1; in_phone_count_step < benchmark_in_phone_count_steps; in_phone_count_step++) {
    max_in_phone_count *= test_in_phone_count_step_factor;
  }
  test_in_phones = memalign(64, max_in_phone_count * sizeof(phone_t));
  test_in_uuids = memalign(64, max_in_phone_count * sizeof(uuid_t));
  for (size_t test_in_phone_idx = 0; test_in_phone_idx < max_in_phone_count; test_in_phone_idx++) {
    test_in_phones[test_in_phone_idx] = test_rand64();
    test_in_uuids[test_in_phone_idx] = (uuid_t) { .data64 = { test_rand64(), test_rand64() } };
  }

  if (benchmark) {
    benchmark_ab_phone_count_steps = BENCHMARK_AB_PHONE_COUNT_STEPS;
  }
  test_ab_phones = memalign(64, test_ab_phone_count * sizeof(phone_t));
  test_expected_in_ab_phones_result = test_malloc(test_ab_phone_count * sizeof(uuid_t));
  setup_sabd_lookup_test(test_in_phone_count, test_ab_phones, test_ab_phone_count, test_expected_in_ab_phones_result);

  // server_start test arguments
  p_empty_start_args = test_malloc(sizeof(sabd_start_args_t));
  *p_empty_start_args = (sabd_start_args_t) { .max_ab_phones = 0 };

  // server_call test arguments
  size_t valid_msg_buf_size = sizeof(phone_t) + sizeof(((sabd_ratelimit_nonce_t *) 0)->data);
  valid_msg_buf = (sgxsd_msg_buf_t) { .data = test_malloc(valid_msg_buf_size), .size = valid_msg_buf_size };
  memcpy(&valid_msg_buf.data[0], test_in_phones, sizeof(phone_t));
  memset(&valid_msg_buf.data[sizeof(phone_t)], 0, valid_msg_buf.size - sizeof(phone_t));

  size_t valid_reply_data_size = 1 + sizeof(uuid_t);
  valid_reply = (sgxsd_msg_buf_t) { .data = test_malloc(valid_reply_data_size), .size = valid_reply_data_size };
  valid_reply.data[0] = 0;
  memcpy(&valid_reply.data[1], (uint8_t *) test_in_uuids, sizeof(uuid_t));

  dummy_msg_from = (sgxsd_msg_from_t) { .tag = { .p_tag = NULL }, .server_key = {{0}}};
  p_valid_call_args = test_malloc(sizeof(sabd_call_args_t));
  *p_valid_call_args = (sabd_call_args_t) { .ab_phone_count = 1, .ratelimit_set_slot_count = 0, .p_ratelimit_set = NULL };

  // server_terminate test arguments
  p_empty_stop_args = test_malloc(sizeof(sabd_stop_args_t));
  *p_empty_stop_args = (sabd_stop_args_t) { .in_phones = NULL, .in_uuids = NULL, .in_phone_count = 0 };
  p_valid_stop_args = test_malloc(sizeof(sabd_stop_args_t));
  *p_valid_stop_args = (sabd_stop_args_t) { .in_phones = test_in_phones, .in_uuids = test_in_uuids, .in_phone_count = 1 };
}

void teardown_tests(void **state) {
  test_free(test_in_phones);
  test_free(test_in_uuids);
  test_free(test_ab_phones);
  test_free(test_expected_in_ab_phones_result);
  test_free(valid_msg_buf.data);
  test_free(valid_reply.data);
  test_free(p_empty_start_args);
  test_free(p_valid_call_args);
  test_free(p_empty_stop_args);
  test_free(p_valid_stop_args);
}

void setup_sabd_server_test(void **state) {
  p_server_state = NULL;
}
void teardown_sabd_server_test(void **state) {
  assert_int_equal(p_server_state, NULL);
}

void test_sabd_server_init(sgx_status_t res, sabd_start_args_t args) {
  assert_int_equal(p_server_state, NULL);
  // allocate on heap to get -fsanitize=address instrumentation
  sabd_start_args_t *p_args_copy = test_malloc(sizeof(args));
  *p_args_copy = args;
  p_server_state = NULL;
  assert_int_equal(res, sgxsd_enclave_server_init(p_args_copy, &p_server_state));
  if (res == SGX_SUCCESS) {
    assert_int_not_equal(p_server_state, NULL);
  } else {
    assert_int_equal(p_server_state, NULL);
  }
  test_free(p_args_copy);
}

void test_sabd_server_call(sgx_status_t res, sgxsd_msg_buf_t *expected_reply,
                           sabd_call_args_t args, sgxsd_msg_buf_t msg, sgxsd_msg_from_t from) {

  // allocate on heap to get -fsanitize=address instrumentation
  sabd_ratelimit_set_t *p_ratelimit_set = NULL;
  size_t ratelimit_set_size = sizeof(*args.p_ratelimit_set) + args.ratelimit_set_slot_count * sizeof(args.p_ratelimit_set->slots[0]);
  if (args.p_ratelimit_set != NULL) {
    p_ratelimit_set = test_malloc(ratelimit_set_size);
    memcpy(p_ratelimit_set, args.p_ratelimit_set, ratelimit_set_size);

    will_return(sgx_is_outside_enclave, (int) { 1 });
  }
  sabd_call_args_t *p_args_copy = test_malloc(sizeof(args));
  *p_args_copy = args;
  p_args_copy->p_ratelimit_set = p_ratelimit_set;

  sgxsd_msg_buf_t msg_copy = {
    .data = test_malloc(msg.size),
    .size = msg.size,
  };
  if (msg.data != NULL) {
    memcpy(msg_copy.data, msg.data, msg.size);
  }

  sgxsd_server_state_t *p_new_server_state = p_server_state;
  assert_int_equal(res, sgxsd_enclave_server_handle_call(p_args_copy, msg_copy, from, &p_new_server_state));

  if (p_ratelimit_set != NULL) {
    memcpy(args.p_ratelimit_set, p_ratelimit_set, ratelimit_set_size);
    test_free(p_ratelimit_set);
  }
  test_free(msg_copy.data);
  test_free(p_args_copy);

  if (expected_reply != NULL) {
    expect_value(sgxsd_enclave_server_reply, reply_buf.size, expected_reply->size);
    expect_memory(sgxsd_enclave_server_reply, reply_buf.data, expected_reply->data, expected_reply->size);
    will_return(sgxsd_enclave_server_reply, (sgx_status_t) { SGX_SUCCESS });
  }

  // state pointer currently never changes
  assert_int_equal(p_new_server_state, p_server_state);
}

void test_sabd_server_term(sgx_status_t res, sabd_stop_args_t args) {
  assert_in_range(args.in_phone_count, 0, SIZE_MAX / sizeof(args.in_phones[0]));
  assert_in_range(args.in_phone_count, 0, SIZE_MAX / sizeof(args.in_uuids[0]));
  will_return(sgx_is_outside_enclave, (int) { 1 });
  will_return(sgx_is_outside_enclave, (int) { 1 });

  // allocate on heap to get -fsanitize=address instrumentation
  sabd_stop_args_t *p_args_copy = test_malloc(sizeof(args));
  *p_args_copy = args;
  assert_int_equal(res, sgxsd_enclave_server_terminate(p_args_copy, p_server_state));
  test_free(p_args_copy);
  p_server_state = NULL;
}

void test_sabd_server_null_state(void **state) {
  // test NULL state checks
  test_sabd_server_call(SGX_ERROR_INVALID_STATE, NULL,
                        *p_valid_call_args, valid_msg_buf, dummy_msg_from);
  assert_int_equal(SGX_ERROR_INVALID_STATE, sgxsd_enclave_server_terminate(p_empty_stop_args, NULL));
  p_server_state = NULL;
}

void test_sabd_server_in_phones_outside_enclave(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  will_return(sgx_is_outside_enclave, (int) { 0 });
  assert_int_equal(SGX_ERROR_INVALID_PARAMETER, sgxsd_enclave_server_terminate(p_valid_stop_args, p_server_state));
  p_server_state = NULL;
}
void test_sabd_server_in_uuids_outside_enclave(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  will_return(sgx_is_outside_enclave, (int) { 1 });
  will_return(sgx_is_outside_enclave, (int) { 0 });
  assert_int_equal(SGX_ERROR_INVALID_PARAMETER, sgxsd_enclave_server_terminate(p_valid_stop_args, p_server_state));
  p_server_state = NULL;
}
void test_sabd_server_in_phones_overflow(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  sabd_stop_args_t *p_in_phone_overflow_stop_args = malloc(sizeof(sabd_stop_args_t));
  *p_in_phone_overflow_stop_args = (sabd_stop_args_t) {
    .in_phones = p_valid_stop_args->in_phones,
    .in_uuids = p_valid_stop_args->in_uuids,
    .in_phone_count = p_valid_stop_args->in_phone_count + SIZE_MAX / sizeof(p_valid_stop_args->in_phones[0]),
  };
  assert_int_equal(SGX_ERROR_INVALID_PARAMETER, sgxsd_enclave_server_terminate
                   (p_in_phone_overflow_stop_args, p_server_state));
  test_free(p_in_phone_overflow_stop_args);
  p_server_state = NULL;
}
void test_sabd_server_in_uuids_overflow(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  sabd_stop_args_t *p_in_uuid_overflow_stop_args = malloc(sizeof(sabd_stop_args_t));
  *p_in_uuid_overflow_stop_args = (sabd_stop_args_t) {
    .in_phones = p_valid_stop_args->in_phones,
    .in_uuids = p_valid_stop_args->in_uuids,
    .in_phone_count = p_valid_stop_args->in_phone_count + SIZE_MAX / sizeof(p_valid_stop_args->in_uuids[0]),
  };
  assert_int_equal(SGX_ERROR_INVALID_PARAMETER, sgxsd_enclave_server_terminate
                   (p_in_uuid_overflow_stop_args, p_server_state));
  test_free(p_in_uuid_overflow_stop_args);
  p_server_state = NULL;
}

void test_sabd_server_init_invalid_args(void **state) {
  assert_int_equal(SGX_ERROR_INVALID_PARAMETER, sgxsd_enclave_server_init(NULL, &p_server_state));
  assert_int_equal(p_server_state, NULL);
}

void test_sabd_server_call_invalid_args(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  sgxsd_server_state_t *p_valid_server_state = p_server_state;
  assert_int_equal(SGX_ERROR_INVALID_PARAMETER, sgxsd_enclave_server_handle_call
                   (NULL, valid_msg_buf, dummy_msg_from, &p_server_state));
  assert_int_equal(p_server_state, p_valid_server_state);
  test_sabd_server_term(SGX_SUCCESS, *p_empty_stop_args);
}
void test_sabd_server_term_invalid_args(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  assert_int_equal(SGX_ERROR_INVALID_PARAMETER, sgxsd_enclave_server_terminate(NULL, p_server_state));
  p_server_state = NULL;
}

void test_sabd_server_zero_max_batch(void **state) {
  test_sabd_server_init(SGX_SUCCESS, (sabd_start_args_t) { .max_ab_phones = 0 });
  test_sabd_server_term(SGX_SUCCESS, *p_empty_stop_args);
}

void test_sabd_server_empty_batch(void **state) {
  test_sabd_server_init(SGX_SUCCESS, (sabd_start_args_t) { .max_ab_phones = 1 });
  test_sabd_server_term(SGX_SUCCESS, *p_valid_stop_args);
}

void test_sabd_server_empty_msg(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  test_sabd_server_call(SGX_ERROR_INVALID_PARAMETER, NULL,
                        (sabd_call_args_t) { .ab_phone_count = 0, .ratelimit_set_slot_count = 0, .p_ratelimit_set = NULL },
                        (sgxsd_msg_buf_t)  { .data = NULL, .size = 0 },
                        dummy_msg_from);
  test_sabd_server_term(SGX_SUCCESS, *p_empty_stop_args);
}

void test_sabd_server_invalid_msg_size(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  test_sabd_server_call(SGX_ERROR_INVALID_PARAMETER, NULL,
                        (sabd_call_args_t) { .ab_phone_count = 1, .ratelimit_set_slot_count = 0, .p_ratelimit_set = NULL },
                        (sgxsd_msg_buf_t)  { .data = valid_msg_buf.data, .size = valid_msg_buf.size - 1 },
                        dummy_msg_from);
  test_sabd_server_term(SGX_SUCCESS, *p_empty_stop_args);
}

void test_sabd_server_msg_size_mismatch(void **state) {
  test_sabd_server_init(SGX_SUCCESS, *p_empty_start_args);
  test_sabd_server_call(SGX_ERROR_INVALID_PARAMETER, NULL,
                        (sabd_call_args_t) { .ab_phone_count = 2, .ratelimit_set_slot_count = 0, .p_ratelimit_set = NULL },
                        valid_msg_buf,
                        dummy_msg_from);
  test_sabd_server_term(SGX_SUCCESS, *p_empty_stop_args);
}

void test_sabd_server_valid_msg(void **state) {
  test_sabd_server_init(SGX_SUCCESS, (sabd_start_args_t) { .max_ab_phones = 1 });
  test_sabd_server_call(SGX_SUCCESS, &valid_reply,
                        *p_valid_call_args, valid_msg_buf, dummy_msg_from);
  expect_any(sabd_lookup_hash, hash_table_tries);
  test_sabd_server_term(SGX_SUCCESS, *p_valid_stop_args);
}

void test_sabd_server_batch_overflow_0(void **state) {
  test_sabd_server_init(SGX_SUCCESS, (sabd_start_args_t) { .max_ab_phones = 0 });
  test_sabd_server_call(SGX_ERROR_INVALID_PARAMETER, NULL,
                        *p_valid_call_args, valid_msg_buf, dummy_msg_from);
  test_sabd_server_term(SGX_SUCCESS, *p_valid_stop_args);
}

void test_sabd_server_batch_overflow_1(void **state) {
  test_sabd_server_init(SGX_SUCCESS, (sabd_start_args_t) { .max_ab_phones = 1 });
  test_sabd_server_call(SGX_SUCCESS, &valid_reply,
                        *p_valid_call_args, valid_msg_buf, dummy_msg_from);
  test_sabd_server_call(SGX_ERROR_INVALID_PARAMETER, NULL,
                        *p_valid_call_args, valid_msg_buf, dummy_msg_from);
  expect_any(sabd_lookup_hash, hash_table_tries);
  test_sabd_server_term(SGX_SUCCESS, *p_valid_stop_args);
}

void test_sabd_server_reply_fail(void **state) {
  test_sabd_server_init(SGX_SUCCESS, (sabd_start_args_t) { .max_ab_phones = 3 });
  test_sabd_server_call(SGX_SUCCESS, &valid_reply,
                        *p_valid_call_args, valid_msg_buf, dummy_msg_from);
  test_sabd_server_call(SGX_SUCCESS, NULL,
                        *p_valid_call_args, valid_msg_buf, dummy_msg_from);
  expect_any(sgxsd_enclave_server_reply, reply_buf.size);
  expect_any(sgxsd_enclave_server_reply, reply_buf.data);
  will_return(sgxsd_enclave_server_reply, (sgx_status_t) { SGX_ERROR_UNEXPECTED });
  test_sabd_server_call(SGX_SUCCESS, &valid_reply,
                        *p_valid_call_args, valid_msg_buf, dummy_msg_from);
  expect_any(sabd_lookup_hash, hash_table_tries);
  test_sabd_server_term(SGX_ERROR_UNEXPECTED, *p_valid_stop_args);
}

void test_sabd_server_ratelimit(sabd_ratelimit_set_element_t *p_slots, uint32_t slot_count, uint32_t space_remaining, bool ratelimited) {
  size_t slots_size = slot_count * sizeof(((sabd_ratelimit_set_t *) 0)->slots[0]);
  sabd_call_args_t call_args = {
    .ab_phone_count = p_valid_call_args->ab_phone_count,
    .ratelimit_set_slot_count = slot_count,
    .p_ratelimit_set = test_malloc(sizeof(sabd_ratelimit_set_t) + slots_size),
  };
  call_args.p_ratelimit_set->space_remaining = space_remaining;
  if (p_slots != NULL) {
    memcpy(&call_args.p_ratelimit_set->slots[0], p_slots, slots_size);
  } else {
    memset(&call_args.p_ratelimit_set->slots[0], 0, slots_size);
  }

  sgxsd_msg_buf_t expected_reply = {
    .data = test_malloc(valid_reply.size),
    .size = valid_reply.size,
  };
  if (ratelimited) {
    expected_reply.data[0] = 1;
    memset(&expected_reply.data[1], UINT8_MAX, expected_reply.size - 1);
  } else {
    memcpy(expected_reply.data, valid_reply.data, expected_reply.size);
  }

  test_sabd_server_init(SGX_SUCCESS, (sabd_start_args_t) { .max_ab_phones = 2 });
  test_sabd_server_call(SGX_SUCCESS, &expected_reply,
                        call_args, valid_msg_buf, dummy_msg_from);
  test_sabd_server_call(SGX_SUCCESS, &expected_reply,
                        call_args, valid_msg_buf, dummy_msg_from);

  test_free(expected_reply.data);
  test_free(call_args.p_ratelimit_set);

  expect_any(sabd_lookup_hash, hash_table_tries);
  test_sabd_server_term(SGX_SUCCESS, *p_valid_stop_args);
}

void test_sabd_server_ratelimit_set_full_size_zero(void **state) {
  test_sabd_server_ratelimit(NULL, 0, 0, true);
}

void test_sabd_server_ratelimit_set_full_size_one(void **state) {
  test_sabd_server_ratelimit(NULL, 1, 0, true);
}

void test_sabd_server_ratelimit_set_undersized_size_zero(void **state) {
  test_sabd_server_ratelimit(NULL, 0, 1, true);
}

void test_sabd_server_ratelimit_set_undersized_size_one(void **state) {
  test_sabd_server_ratelimit((sabd_ratelimit_set_element_t []) { { .hash = { 1 } } }, 1, 1, true);
}

void test_sabd_server_ratelimit_set_nonfull_size_one(void **state) {
  test_sabd_server_ratelimit(NULL, 1, 1, false);
}

void test_sabd_server_ratelimit_set_nonfull(uint8_t slot_count, uint8_t empty_slot_idx) {
  sabd_ratelimit_set_element_t ratelimit_set[slot_count];
  for (uint8_t ratelimit_set_idx = 0; ratelimit_set_idx < slot_count; ratelimit_set_idx++) {
    memset(&ratelimit_set[(empty_slot_idx + ratelimit_set_idx) % slot_count].hash[0], ratelimit_set_idx, sizeof(ratelimit_set[0].hash));
  }
  test_sabd_server_ratelimit(&ratelimit_set[0], slot_count, 1, false);
}

void test_sabd_server_ratelimit_set_nonfull_size_two(void **state) {
  test_sabd_server_ratelimit_set_nonfull(2, 0);
  test_sabd_server_ratelimit_set_nonfull(2, 1);
}

void test_sabd_server_ratelimit_set_nonfull_size_100(void **state) {
  test_sabd_server_ratelimit_set_nonfull(100, 0);
  test_sabd_server_ratelimit_set_nonfull(100, 50);
  test_sabd_server_ratelimit_set_nonfull(100, 99);
}

sgx_status_t sabd_lookup_hash(const phone_t *in_phones, uuid_t *in_uuids, size_t in_phone_count,
                              const phone_t *ab_phones, uint32_t ab_phone_count,
                              volatile uuid_t *in_ab_phones_result);
static
void test_sabd_lookup_batch_too_large(void **state) {
  uint32_t ab_phone_count = ((uint32_t) { 1 } << 14) + 1;
  phone_t *ab_phones = test_calloc(ab_phone_count, sizeof(phone_t));
  uuid_t *in_ab_phones_result = test_malloc(ab_phone_count * sizeof(uuid_t));
  assert_int_equal(SGX_ERROR_INVALID_PARAMETER, sabd_lookup_hash
                   (test_in_phones, test_in_uuids, test_in_phone_count, ab_phones, ab_phone_count, in_ab_phones_result));
  test_free(in_ab_phones_result);
  test_free(ab_phones);
}
void test_sabd_lookup(size_t in_phone_count, phone_t *ab_phones, uint32_t ab_phone_count, const uuid_t *expected_in_ab_phones_result) {
  size_t in_ab_phones_result_size = ab_phone_count * sizeof(uuid_t);
  uuid_t *in_ab_phones_result = test_calloc(in_ab_phones_result_size, 1);
  if (ab_phone_count != 0) {
    expect_any(sabd_lookup_hash, hash_table_tries);
  }
  assert_int_equal(SGX_SUCCESS, sabd_lookup_hash
                   (test_in_phones, test_in_uuids, in_phone_count, ab_phones, ab_phone_count, in_ab_phones_result));
  assert_memory_equal(in_ab_phones_result, expected_in_ab_phones_result, in_ab_phones_result_size);
  test_free(in_ab_phones_result);
}
static
void test_sabd_lookup_many_duplicates(void **state) {
  uint32_t ab_phone_count = test_ab_phone_count;
  size_t ab_phones_size = ab_phone_count * sizeof(phone_t);
  phone_t *ab_phones = test_malloc(ab_phones_size);
  memcpy(ab_phones, test_ab_phones, ab_phones_size);
  uuid_t *expected_in_ab_phones_result = test_malloc(ab_phone_count * sizeof(uuid_t));
  memcpy(expected_in_ab_phones_result, test_expected_in_ab_phones_result, ab_phone_count * sizeof(uuid_t));
  for (uint32_t ab_phone_idx = 0; ab_phone_idx < ab_phone_count; ab_phone_idx += 2) {
    ab_phones[ab_phone_idx] = ab_phones[0];
    expected_in_ab_phones_result[ab_phone_idx] = expected_in_ab_phones_result[0];
  }
  test_sabd_lookup(test_in_phone_count, ab_phones, ab_phone_count, expected_in_ab_phones_result);
  test_free(expected_in_ab_phones_result);
  test_free(ab_phones);
}
static
void test_sabd_lookup_small(bool use_in_phones) {
  uint32_t max_ab_phone_count = 32;
  phone_t *ab_phones = test_malloc(max_ab_phone_count * sizeof(phone_t));
  uuid_t *expected_in_ab_phones_result = test_malloc(max_ab_phone_count * sizeof(uuid_t));
  for (uint32_t test_ab_phone_idx = 0, ab_phone_idx = 0;
       test_ab_phone_idx < test_ab_phone_count && ab_phone_idx < max_ab_phone_count;
       test_ab_phone_idx++) {
    bool test_expected_in_ab_phone_result = (test_expected_in_ab_phones_result[test_ab_phone_idx].data64[0] ||
                                             test_expected_in_ab_phones_result[test_ab_phone_idx].data64[1]);
    if (test_expected_in_ab_phone_result == use_in_phones) {
      expected_in_ab_phones_result[ab_phone_idx] = test_expected_in_ab_phones_result[test_ab_phone_idx];
      ab_phones[ab_phone_idx++] = test_ab_phones[test_ab_phone_idx];
    }
  }
  for (uint32_t ab_phone_count = 0; ab_phone_count <= max_ab_phone_count; ab_phone_count++) {
    test_sabd_lookup(test_in_phone_count, ab_phones, ab_phone_count, expected_in_ab_phones_result);
  }
  test_free(expected_in_ab_phones_result);
  test_free(ab_phones);
}
static
void test_sabd_lookup_small_all_in_phones(void **state) {
  test_sabd_lookup_small(true);
}
static
void test_sabd_lookup_small_no_in_phones(void **state) {
  test_sabd_lookup_small(false);
}
static
void test_sabd_lookup_small_random(void **state) {
  for (uint32_t ab_phone_count = 0; ab_phone_count <= 25; ab_phone_count++) {
    test_sabd_lookup(test_in_phone_count, test_ab_phones, ab_phone_count, test_expected_in_ab_phones_result);
  }
}
static
void test_sabd_lookup_large(void **state) {
  test_sabd_lookup(test_in_phone_count, test_ab_phones, test_ab_phone_count, test_expected_in_ab_phones_result);
}

static
int test_sabd_lookup_hash_table_overflow_check(LargestIntegralType value, LargestIntegralType check_value_data) {
  uint32_t *p_overflow_count = (uint32_t *) check_value_data;
  *p_overflow_count += value;
  return true;
}
static
void test_sabd_lookup_hash_table_overflow(void **state) {
  uint32_t ab_phone_count = test_hash_table_overflow_ab_phone_count;
  uuid_t *in_ab_phones_result = test_malloc(ab_phone_count * sizeof(uuid_t));
  uint32_t overflow_count = 0;
  uint32_t run_count = benchmark? benchmark_hash_table_overflow_run_count : test_hash_table_overflow_run_count;
  // divide (rounded up) by how many times we're going to run this test in total
  run_count = (run_count + test_run_count - 1) / test_run_count;
  _expect_check("sabd_lookup_hash", "hash_table_tries", __FILE__, __LINE__,
                test_sabd_lookup_hash_table_overflow_check, cast_to_largest_integral_type(&overflow_count),
                NULL, run_count);
  for (uint32_t run_idx = 0; run_idx < run_count; run_idx++) {
    assert_int_equal(SGX_SUCCESS, sabd_lookup_hash(test_in_phones, test_in_uuids, 0, test_ab_phones, ab_phone_count, in_ab_phones_result));
  }
  print_message("finished %zu %zu-phone ab lookups with %zu overflows (< %g%%)\n",
                run_count, ab_phone_count, overflow_count, (overflow_count + 1) * 100.0 / run_count);
  assert_in_range(overflow_count, 0, test_hash_table_overflow_max_count);
  test_free(in_ab_phones_result);
}

static
void test_sabd_lookup_benchmark(void **state) {
  size_t in_phone_count = test_in_phone_count;
  for (uint32_t in_phone_count_step = 0; in_phone_count_step < benchmark_in_phone_count_steps; in_phone_count_step++) {
    uint32_t ab_phone_count = test_ab_phone_count;
    for (uint32_t ab_phone_count_step = 0; ab_phone_count_step < benchmark_ab_phone_count_steps; ab_phone_count_step++) {
      phone_t *ab_phones = memalign(64, ab_phone_count * sizeof(phone_t));
      uuid_t *expected_in_ab_phones_result = test_malloc(ab_phone_count * sizeof(uuid_t));
      setup_sabd_lookup_test(in_phone_count, ab_phones, ab_phone_count, expected_in_ab_phones_result);
    
      struct timespec lookup_start;
      clock_gettime(CLOCK_THREAD_CPUTIME_ID, &lookup_start);

      test_sabd_lookup(in_phone_count, ab_phones, ab_phone_count, expected_in_ab_phones_result);

      struct timespec lookup_end;
      clock_gettime(CLOCK_THREAD_CPUTIME_ID, &lookup_end);
      double lookup_elapsed =
        (lookup_end.tv_sec + lookup_end.tv_nsec / 1e9) - (lookup_start.tv_sec + lookup_start.tv_nsec / 1e9);
      print_message("finished %5zu phone ab lookup on %10zu phones in %05.3fs (%#05.3es / ab phone) (%0llu cycles / phone)\n",
                    ab_phone_count, in_phone_count, lookup_elapsed, lookup_elapsed / ab_phone_count, test_total_tsc / in_phone_count);

      test_free(ab_phones);
      test_free(expected_in_ab_phones_result);

      ab_phone_count *= test_ab_phone_count_step_factor;
    }
    in_phone_count *= test_in_phone_count_step_factor;
  }
}

int sgx_is_outside_enclave(const void *addr, size_t size) {
  return (int) mock();
}

sgx_status_t sgxsd_enclave_server_reply(sgxsd_msg_buf_t reply_buf, sgxsd_msg_from_t from) {
  check_expected(reply_buf.size);
  check_expected(reply_buf.data);
  return (sgx_status_t) mock();
}

#define unit_test_sabd_server(test) unit_test_setup_teardown(test, setup_sabd_server_test, teardown_sabd_server_test)

int main(int argc, char *argv[]) {
  bool benchmark_only = false;
  for (int arg_idx = 1; arg_idx < argc; arg_idx++) {
    if (strcmp(argv[arg_idx], "--benchmark") == 0) {
      benchmark = true;
    } else if (strcmp(argv[arg_idx], "--benchmark-only") == 0) {
      benchmark = true;
      benchmark_only = true;
    } else {
      print_error("Usage: %s [--benchmark]\n", argv[0]);
      return 1;
    }
  }

  UnitTest tests[] = {
    unit_test_setup(tests, setup_tests),
    unit_test_sabd_server(test_sabd_server_null_state),
    unit_test_sabd_server(test_sabd_server_in_phones_outside_enclave),
    unit_test_sabd_server(test_sabd_server_in_phones_overflow),
    unit_test_sabd_server(test_sabd_server_init_invalid_args),
    unit_test_sabd_server(test_sabd_server_call_invalid_args),
    unit_test_sabd_server(test_sabd_server_term_invalid_args),
    unit_test_sabd_server(test_sabd_server_zero_max_batch),
    unit_test_sabd_server(test_sabd_server_empty_batch),
    unit_test_sabd_server(test_sabd_server_empty_msg),
    unit_test_sabd_server(test_sabd_server_invalid_msg_size),
    unit_test_sabd_server(test_sabd_server_msg_size_mismatch),
    unit_test_sabd_server(test_sabd_server_valid_msg),
    unit_test_sabd_server(test_sabd_server_batch_overflow_0),
    unit_test_sabd_server(test_sabd_server_batch_overflow_1),
    unit_test_sabd_server(test_sabd_server_reply_fail),
    unit_test_sabd_server(test_sabd_server_ratelimit_set_full_size_zero),
    unit_test_sabd_server(test_sabd_server_ratelimit_set_full_size_one),
    unit_test_sabd_server(test_sabd_server_ratelimit_set_nonfull_size_one),
    unit_test_sabd_server(test_sabd_server_ratelimit_set_nonfull_size_two),
    unit_test_sabd_server(test_sabd_server_ratelimit_set_nonfull_size_100),
    unit_test_sabd_server(test_sabd_server_ratelimit_set_undersized_size_zero),
    unit_test_sabd_server(test_sabd_server_ratelimit_set_undersized_size_one),
    unit_test(test_sabd_lookup_batch_too_large),
    unit_test(test_sabd_lookup_many_duplicates),
    unit_test(test_sabd_lookup_small_no_in_phones),
    unit_test(test_sabd_lookup_small_all_in_phones),
    unit_test(test_sabd_lookup_small_random),
    unit_test(test_sabd_lookup_large),
    unit_test(test_sabd_lookup_hash_table_overflow),
    unit_test(test_sabd_lookup_benchmark),
    unit_test_teardown(tests, teardown_tests),
  };

  UnitTest benchmark_only_tests[] = {
    unit_test_setup(tests, setup_tests),
    unit_test(test_sabd_lookup_benchmark),
    unit_test_teardown(tests, teardown_tests),
  };

  if (benchmark) {
    test_run_count = BENCHMARK_TEST_RUN_COUNT;
  }
  for (uint32_t test_run = 0; test_run < test_run_count; test_run++) {
    int res;
    if (benchmark_only) {
      res = run_tests(benchmark_only_tests) != 0;
    } else {
      res = run_tests(tests) != 0;
    }
    if (res != 0) {
      return res;
    }
    mrand48_r(&test_drand48_data, &test_drand48_seed);
    test_drand48_seed &= UINT32_MAX;
  }
  return 0;
}

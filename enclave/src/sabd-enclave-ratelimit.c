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

#include <string.h>

#include "bearssl_hash.h"

#include "sabd-enclave.h"
#include "sgxsd-enclave.h"

#include "sgx_trts.h"

#if UNIT_TESTING
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include "cmockery.h"
#include "test_memset_s.h"
#endif

void sabd_ratelimit(sabd_ratelimit_set_t *p_ratelimit_set,
                    uint32_t ratelimit_set_slot_count,
                    phone_t *p_query_phones,
                    const sabd_ratelimit_nonce_t *p_query_nonces,
                    uint8_t *p_query_ratelimited,
                    uint32_t query_phone_count)
{
  br_sha512_context query_hash_context;

  for (uint32_t query_phone_idx = 0; query_phone_idx < query_phone_count; query_phone_idx++) {
    uint8_t query_hash[br_sha512_SIZE];
    br_sha512_init(&query_hash_context);
    br_sha512_update(&query_hash_context, &p_query_phones[query_phone_idx],      sizeof(p_query_phones[0]));
    br_sha512_update(&query_hash_context, &p_query_nonces[query_phone_idx].data, sizeof(p_query_nonces[0].data));
    br_sha512_out(&query_hash_context, &query_hash);

    sabd_ratelimit_set_element_t empty_set_element = { .hash = {0} };
    sabd_ratelimit_set_element_t query_set_element = empty_set_element;
    memcpy(&query_set_element.hash, &query_hash, sizeof(query_set_element.hash));
    _Static_assert(sizeof(query_set_element.hash) <= sizeof(query_hash), "sabd_ratelimit_set_element.hash overflow");

    uint32_t query_set_element_least_32 = 0;
    memcpy(&query_set_element_least_32, &query_set_element.hash, sizeof(uint32_t));
    _Static_assert(sizeof(uint32_t) <= sizeof(query_set_element.hash), "uint32_t overflow");

    bool query_hash_added = false;
    if (ratelimit_set_slot_count != 0) {
      for (uint32_t ratelimit_set_offset = 0,
                    ratelimit_set_idx    = query_set_element_least_32 % ratelimit_set_slot_count;
           ratelimit_set_offset < ratelimit_set_slot_count;
           ratelimit_set_offset++, ratelimit_set_idx++)
        {
          if (ratelimit_set_idx >= ratelimit_set_slot_count) {
            ratelimit_set_idx = 0;
          }
          if (0 == memcmp(&p_ratelimit_set->slots[ratelimit_set_idx].hash, &empty_set_element.hash, sizeof(empty_set_element.hash))) {
            if (p_ratelimit_set->space_remaining != 0) {
              p_ratelimit_set->slots[ratelimit_set_idx] = query_set_element;
              p_ratelimit_set->space_remaining -= 1;
              query_hash_added = true;
            }
            break;
          }
          if (0 == memcmp(&p_ratelimit_set->slots[ratelimit_set_idx].hash, &query_set_element.hash, sizeof(query_set_element.hash))) {
            query_hash_added = true;
            break;
          }
        }
    }
    if (!query_hash_added) {
      p_query_phones[query_phone_idx] = 0;
      p_query_ratelimited[query_phone_idx] = 1;
    }
  }

  memset_s(&query_hash_context, sizeof(query_hash_context), 0, sizeof(query_hash_context));
}

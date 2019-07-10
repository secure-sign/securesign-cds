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

#include "sgx_trts.h"

#if UNIT_TESTING
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include "cmockery.h"
#include "test_memset_s.h"

unsigned long long test_total_tsc;
#endif

#define likely(x)       __builtin_expect(!!(x), 1)
#define unlikely(x)     __builtin_expect(!!(x), 0)

#define CHAIN_BLOCK_COUNT 4
#define CHAIN_BLOCK_PHONE_COUNT (32 / sizeof(phone_t))
#define CHAIN_PHONE_COUNT (CHAIN_BLOCK_COUNT * CHAIN_BLOCK_PHONE_COUNT)

#ifndef SABD_MAX_HASH_TABLE_ORDER
#define SABD_MAX_HASH_TABLE_ORDER 13
#endif

typedef uint32_t hash_slot_idx_t;
typedef struct sabd_lookup_hash_salt {
  __m128i sk[11];
} sabd_lookup_hash_salt_t;

typedef struct sabd_lookup_hashed_ab_phones_result {
  __m256i uuids[2];
} sabd_lookup_hashed_ab_phones_result_t;

static inline __m128i
expand_step128(__m128i k, __m128i k2) {
  k = _mm_xor_si128(k, _mm_slli_si128(k, 4));
  k = _mm_xor_si128(k, _mm_slli_si128(k, 4));
  k = _mm_xor_si128(k, _mm_slli_si128(k, 4));
  k2 = _mm_shuffle_epi32(k2, 0xFF);
  return _mm_xor_si128(k, k2);
}
static inline
sabd_lookup_hash_salt_t sabd_lookup_hash_salt(unsigned long long *hash_salt_64) {
  sabd_lookup_hash_salt_t hash_salt;
  hash_salt.sk[0]  = _mm_set_epi64x(hash_salt_64[0], hash_salt_64[1]);
  hash_salt.sk[1]  = expand_step128(hash_salt.sk[0], _mm_aeskeygenassist_si128(hash_salt.sk[0], 0x01));
  hash_salt.sk[2]  = expand_step128(hash_salt.sk[1], _mm_aeskeygenassist_si128(hash_salt.sk[1], 0x02));
  hash_salt.sk[3]  = expand_step128(hash_salt.sk[2], _mm_aeskeygenassist_si128(hash_salt.sk[2], 0x04));
  hash_salt.sk[4]  = expand_step128(hash_salt.sk[3], _mm_aeskeygenassist_si128(hash_salt.sk[3], 0x08));
  hash_salt.sk[5]  = expand_step128(hash_salt.sk[4], _mm_aeskeygenassist_si128(hash_salt.sk[4], 0x10));
  hash_salt.sk[6]  = expand_step128(hash_salt.sk[5], _mm_aeskeygenassist_si128(hash_salt.sk[5], 0x20));
  hash_salt.sk[7]  = expand_step128(hash_salt.sk[6], _mm_aeskeygenassist_si128(hash_salt.sk[6], 0x40));
  hash_salt.sk[8]  = expand_step128(hash_salt.sk[7], _mm_aeskeygenassist_si128(hash_salt.sk[7], 0x80));
  hash_salt.sk[9]  = expand_step128(hash_salt.sk[8], _mm_aeskeygenassist_si128(hash_salt.sk[8], 0x1B));
  hash_salt.sk[10] = expand_step128(hash_salt.sk[9], _mm_aeskeygenassist_si128(hash_salt.sk[9], 0x36));
  return hash_salt;
}

static inline
hash_slot_idx_t sabd_lookup_hash_slot(phone_t phone, sabd_lookup_hash_salt_t hash_salt, uint32_t hash_table_order) {
  __m128i hash = _mm_cvtsi64_si128(phone);
  hash =        _mm_xor_si128(hash, hash_salt.sk[0]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[1]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[2]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[3]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[4]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[5]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[6]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[7]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[8]);
  hash =     _mm_aesenc_si128(hash, hash_salt.sk[9]);
  hash = _mm_aesenclast_si128(hash, hash_salt.sk[10]);

  return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
}

static inline
void sabd_lookup_hash_phone_chain_block(volatile sabd_lookup_hashed_ab_phones_result_t *chain_results,
                                        __m256i *in_uuid_blocks,
                                        __m256i *chain_eq,
                                        int chain_block_idx)
{
  for (int uuid_idx = 0; uuid_idx < 2; uuid_idx++) {
    volatile __m256i *chain_result    = &chain_results[chain_block_idx].uuids[uuid_idx];
    const    __m256i dummy_write_mask = _mm256_set_epi64x(0, 0, 0, UINT64_MAX);

    *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
                                       in_uuid_blocks[uuid_idx],
                                       chain_eq[chain_block_idx]);
  }
}

static inline
void sabd_lookup_hash_phone(phone_t in_phone, uuid_t in_uuid,
                            sabd_lookup_hash_salt_t hash_salt, uint32_t hash_table_order,
                            phone_t *hashed_ab_phones,
                            volatile sabd_lookup_hashed_ab_phones_result_t *in_hashed_ab_phones_result)
{
  // never allow comparing equal to our per-chain-block dummy value of zero
  const __m256i chain_block_dummy_mask = _mm256_set_epi64x(0, 0, 0, UINT64_MAX);
  __m256i in_phone_block = _mm256_or_si256(_mm256_set1_epi64x(in_phone), chain_block_dummy_mask);

  // find the hash slot
  hash_slot_idx_t in_phone_hash_slot_idx = sabd_lookup_hash_slot(in_phone, hash_salt, hash_table_order);

  // search the hash slot chain in each request's hash table
  __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];

  __m256i chain_eq[] = {
    _mm256_cmpeq_epi64(in_phone_block, chain_blocks[0]),
    _mm256_cmpeq_epi64(in_phone_block, chain_blocks[1]),
    _mm256_cmpeq_epi64(in_phone_block, chain_blocks[2]),
    _mm256_cmpeq_epi64(in_phone_block, chain_blocks[3]),
  };

  // update result bit array, flipping all bits to force a cache line flush
  __m256i in_uuid_blocks[] = {
    _mm256_set1_epi64x(in_uuid.data64[0]),
    _mm256_set1_epi64x(in_uuid.data64[1]),
  };

  volatile sabd_lookup_hashed_ab_phones_result_t *chain_results =
    &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
  sabd_lookup_hash_phone_chain_block(chain_results, in_uuid_blocks, chain_eq, 0);
  sabd_lookup_hash_phone_chain_block(chain_results, in_uuid_blocks, chain_eq, 1);
  sabd_lookup_hash_phone_chain_block(chain_results, in_uuid_blocks, chain_eq, 2);
  sabd_lookup_hash_phone_chain_block(chain_results, in_uuid_blocks, chain_eq, 3);
}

static inline
uint64_t sabd_lookup_hash_slot_collect_result(volatile sabd_lookup_hashed_ab_phones_result_t *chain_results,
                                              __m256i *chain_eq,
                                              int uuid_data64_idx)
{
  __m256i chain_result;
  chain_result = _mm256_setzero_si256();
  chain_result = _mm256_blendv_epi8(chain_result, chain_results[0].uuids[uuid_data64_idx], chain_eq[0]);
  chain_result = _mm256_blendv_epi8(chain_result, chain_results[1].uuids[uuid_data64_idx], chain_eq[1]);
  chain_result = _mm256_blendv_epi8(chain_result, chain_results[2].uuids[uuid_data64_idx], chain_eq[2]);
  chain_result = _mm256_blendv_epi8(chain_result, chain_results[3].uuids[uuid_data64_idx], chain_eq[3]);

  return (_mm256_extract_epi64(chain_result, 0) |
          _mm256_extract_epi64(chain_result, 1) |
          _mm256_extract_epi64(chain_result, 2) |
          _mm256_extract_epi64(chain_result, 3));
}


sgx_status_t sabd_lookup_hash(const phone_t *in_phones, const uuid_t *in_uuids, size_t in_phone_count,
                              const phone_t *ab_phones, hash_slot_idx_t ab_phone_count,
                              volatile uuid_t *in_ab_phones_result) {
  const hash_slot_idx_t chain_length = CHAIN_PHONE_COUNT;

  const __m256i chain_block_dummy_mask     = _mm256_set_epi64x(0,          0,          0,          UINT64_MAX);
  const __m256i chain_block_non_dummy_mask = _mm256_set_epi64x(UINT64_MAX, UINT64_MAX, UINT64_MAX, 0);

  // calculate hash table size = ab_phone_count rounded up to the nearest power of 2
  uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;

  // validate hash table size
  if (unlikely(ab_phone_count == 0)) {
    return SGX_SUCCESS;
  }
  if (unlikely(hash_table_order > SABD_MAX_HASH_TABLE_ORDER)) {
    return SGX_ERROR_INVALID_PARAMETER;
  }
  _Static_assert((((hash_slot_idx_t) 1) << SABD_MAX_HASH_TABLE_ORDER) > 0, "hash_table_slot_count overflow");
  hash_slot_idx_t hash_table_slot_count = ((hash_slot_idx_t) 1) << hash_table_order;
  _Static_assert((((hash_slot_idx_t) 1) << SABD_MAX_HASH_TABLE_ORDER) < (UINT32_MAX / chain_length), "hash_table_phone_count overflow");
  hash_slot_idx_t hash_table_phone_count = hash_table_slot_count * chain_length;
  hash_slot_idx_t hash_table_block_count = hash_table_slot_count * CHAIN_BLOCK_COUNT;

  // allocate hash table and auxilary tables
  _Static_assert(hash_table_slot_count < (SIZE_MAX / sizeof(phone_t)) / chain_length, "hashed_ab_phones size overflow");
  size_t hashed_ab_phones_size = hash_table_phone_count * sizeof(phone_t);
  phone_t *hashed_ab_phones = memalign(SABD_CACHE_LINE_SIZE, hashed_ab_phones_size);
  if (unlikely(hashed_ab_phones == NULL)) {
    return SGX_ERROR_OUT_OF_MEMORY;
  }

  _Static_assert(hash_table_block_count < SIZE_MAX / sizeof(sabd_lookup_hashed_ab_phones_result_t), "hash_table_block_count overflow");
  size_t in_hashed_ab_phones_result_size = hash_table_block_count * sizeof(sabd_lookup_hashed_ab_phones_result_t);
  volatile sabd_lookup_hashed_ab_phones_result_t *in_hashed_ab_phones_result = memalign(SABD_CACHE_LINE_SIZE, in_hashed_ab_phones_result_size);
  _Static_assert(SABD_CACHE_LINE_SIZE >= _Alignof(sabd_lookup_hashed_ab_phones_result_t) &&
                 SABD_CACHE_LINE_SIZE  % _Alignof(sabd_lookup_hashed_ab_phones_result_t) == 0,
                 "packed __m256i aligns with cache line");
  if (unlikely(in_hashed_ab_phones_result == NULL)) {
    free(hashed_ab_phones);
    return SGX_ERROR_OUT_OF_MEMORY;
  }
  memset_s(in_hashed_ab_phones_result, in_hashed_ab_phones_result_size, 0, in_hashed_ab_phones_result_size);

  // write dummy values to result byte array first, so both true and false force a cache line flush
  size_t in_ab_phones_result_size = ab_phone_count * sizeof(in_ab_phones_result[0]);
  memset_s(in_ab_phones_result, in_ab_phones_result_size, UINT8_MAX, in_ab_phones_result_size);

  // fill hash table with zeroes to force a cache line flush on write below
  memset_s(hashed_ab_phones, hashed_ab_phones_size, 0, hashed_ab_phones_size);

  // repeat hash table construction until no hash slots overflow
  sabd_lookup_hash_salt_t hash_salt;
  bool hash_table_constructed = false;
  for (uint32_t hash_table_tries = 0; !hash_table_constructed && likely(hash_table_tries < 128); hash_table_tries++) {
    // generate random salt
    unsigned long long hash_salt_64[2];
    bool hash_salt_rand_res = false;
    for (uint32_t hash_salt_rand_tries = 0; likely(hash_salt_rand_tries < 10); hash_salt_rand_tries++) {
      if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
        hash_salt_rand_res = true;
        break;
      }
    }
    if (unlikely(!hash_salt_rand_res)) {
      break;
    }
    hash_salt = sabd_lookup_hash_salt(hash_salt_64);

    // iterate through hash slots
    bool any_hash_slots_overflowed = false;
    for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
      // find ab phones to insert into the chain
      // NB: these variables need to be allocated as registers and will leak information if on the stack!
      register __m256i chain_blocks[CHAIN_BLOCK_COUNT] = {0};
      register __m256i chain_block_masks[] = {
        _mm256_set_epi64x(UINT64_MAX - 0, UINT64_MAX -  1, UINT64_MAX -  2, 0),
        _mm256_set_epi64x(UINT64_MAX - 3, UINT64_MAX -  4, UINT64_MAX -  5, 0),
        _mm256_set_epi64x(UINT64_MAX - 6, UINT64_MAX -  7, UINT64_MAX -  8, 0),
        _mm256_set_epi64x(UINT64_MAX - 9, UINT64_MAX - 10, UINT64_MAX - 11, 0),
      };
      hash_slot_idx_t chain_idx = 0;
      for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
        phone_t ab_phone = ab_phones[ab_phone_idx];
        __m256i ab_phone_block = _mm256_set1_epi64x(ab_phone);
        hash_slot_idx_t ab_phone_hash_slot_idx = sabd_lookup_hash_slot(ab_phone, hash_salt, hash_table_order);

        // branch-less-ly test if hash slot matches
        uint64_t hash_slot_matches =
          (((uint64_t) (((int64_t) (((uint64_t) ab_phone_hash_slot_idx) ^ ((uint64_t) hash_slot_idx))) - 1))
           >> (sizeof(hash_slot_idx) * 8)) & 1;
        // NB: re-work above expression if this assert fails
        _Static_assert(((int64_t) (((uint64_t) ab_phone_hash_slot_idx) ^ ((uint64_t) hash_slot_idx))) >= 0, "hash_slot_matches overflow");

        // branch-less-ly find out if ab phone is already in chain
        __m256i chain_eq =                   _mm256_cmpeq_epi64(ab_phone_block, chain_blocks[0]);
        chain_eq = _mm256_or_si256(chain_eq, _mm256_cmpeq_epi64(ab_phone_block, chain_blocks[1]));
        chain_eq = _mm256_or_si256(chain_eq, _mm256_cmpeq_epi64(ab_phone_block, chain_blocks[2]));
        chain_eq = _mm256_or_si256(chain_eq, _mm256_cmpeq_epi64(ab_phone_block, chain_blocks[3]));
        bool phone_not_in_chain = _mm256_testz_pd((__m256d) chain_eq, (__m256d) chain_eq);

        // maybe insert ab phone into the chain
        uint64_t should_insert_phone = hash_slot_matches & phone_not_in_chain;
        chain_idx += should_insert_phone;

        chain_blocks[0] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[0], (__m256d) ab_phone_block, (__m256d) chain_block_masks[0]);
        chain_blocks[1] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[1], (__m256d) ab_phone_block, (__m256d) chain_block_masks[1]);
        chain_blocks[2] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[2], (__m256d) ab_phone_block, (__m256d) chain_block_masks[2]);
        chain_blocks[3] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[3], (__m256d) ab_phone_block, (__m256d) chain_block_masks[3]);

        chain_block_masks[0] = _mm256_add_epi64(chain_block_masks[0], _mm256_set1_epi64x(should_insert_phone));
        chain_block_masks[1] = _mm256_add_epi64(chain_block_masks[1], _mm256_set1_epi64x(should_insert_phone));
        chain_block_masks[2] = _mm256_add_epi64(chain_block_masks[2], _mm256_set1_epi64x(should_insert_phone));
        chain_block_masks[3] = _mm256_add_epi64(chain_block_masks[3], _mm256_set1_epi64x(should_insert_phone));
      }
      // mask out last processed phone, with non-zero invalid values to force a cache line flush on write
      __m256i dummy_block = _mm256_set1_epi8(UINT8_MAX);
      chain_blocks[0] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[0], (__m256d) dummy_block, (__m256d) chain_block_masks[0]);
      chain_blocks[1] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[1], (__m256d) dummy_block, (__m256d) chain_block_masks[1]);
      chain_blocks[2] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[2], (__m256d) dummy_block, (__m256d) chain_block_masks[2]);
      chain_blocks[3] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[3], (__m256d) dummy_block, (__m256d) chain_block_masks[3]);

      // write out hash slot chain values
      __m256i *p_chain_blocks = (__m256i *) &hashed_ab_phones[hash_slot_idx * chain_length];
      p_chain_blocks[0] = chain_blocks[0];
      p_chain_blocks[1] = chain_blocks[1];
      p_chain_blocks[2] = chain_blocks[2];
      p_chain_blocks[3] = chain_blocks[3];

      // branch-less-ly trigger a hash table rebuild if too many ab phones hashed to this slot
      any_hash_slots_overflowed |= chain_idx > chain_length;
    }
    hash_table_constructed = !any_hash_slots_overflowed;
    if (unlikely(!hash_table_constructed)) {
      memset_s(hashed_ab_phones, hashed_ab_phones_size, 0, hashed_ab_phones_size);
    }
    #ifdef UNIT_TESTING
    if (hash_table_constructed) {
      check_expected(hash_table_tries);
    }
    #endif
  }
  if (unlikely(!hash_table_constructed)) {
    free((void *) in_hashed_ab_phones_result);
    free(hashed_ab_phones);
    return SGX_ERROR_UNEXPECTED;
  }

#ifdef UNIT_TESTING
  unsigned int tsc_aux;
  unsigned long long start_tsc = __rdtscp(&tsc_aux);
#endif

  const size_t cache_line_phones = SABD_CACHE_LINE_SIZE / sizeof(in_phones[0]);
  const size_t cache_line_uuids  = SABD_CACHE_LINE_SIZE / sizeof(in_uuids[0]);

  _Static_assert(cache_line_phones >= cache_line_uuids &&
                 cache_line_phones  % cache_line_uuids == 0,
                 "cache_line_phones is a multiple of cache_line_uuids");

  const size_t prefetch_phones_dist = cache_line_phones * 2;

  size_t in_phone_idx = 0;
  for (; likely(in_phone_idx + prefetch_phones_dist + cache_line_phones < in_phone_count); in_phone_idx += cache_line_phones) {
    _mm_prefetch(&in_phones[in_phone_idx + prefetch_phones_dist], 0);

    for (size_t cache_line_phone_idx = 0; cache_line_phone_idx < cache_line_phones; cache_line_phone_idx += cache_line_uuids) {
      _mm_prefetch(&in_uuids[in_phone_idx + prefetch_phones_dist + cache_line_phone_idx], 0);
    }

    const phone_t *cached_in_phones = &in_phones[in_phone_idx];
    const uuid_t  *cached_in_uuids  = &in_uuids[in_phone_idx];
    for (size_t cached_in_phone_idx = 0; cached_in_phone_idx < cache_line_phones; cached_in_phone_idx++) {
      sabd_lookup_hash_phone(cached_in_phones[cached_in_phone_idx], cached_in_uuids[cached_in_phone_idx],
                             hash_salt, hash_table_order, hashed_ab_phones, in_hashed_ab_phones_result);
    }
  }
  for (; in_phone_idx < in_phone_count; in_phone_idx++) {
    sabd_lookup_hash_phone(in_phones[in_phone_idx], in_uuids[in_phone_idx],
                           hash_salt, hash_table_order, hashed_ab_phones, in_hashed_ab_phones_result);
  }

#ifdef UNIT_TESTING
  test_total_tsc = __rdtscp(&tsc_aux) - start_tsc;
#endif

  // iterate through request phones, collecting results
  for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
    phone_t ab_phone = ab_phones[ab_phone_idx];
    __m256i ab_phone_block = _mm256_set1_epi64x(ab_phone);
    uuid_t ab_phone_result = {
      .data64 = {0, 0},
    };

    for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
      __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[hash_slot_idx * chain_length];
      __m256i chain_eq[] = {
        _mm256_cmpeq_epi64(ab_phone_block, _mm256_and_si256(chain_blocks[0], chain_block_non_dummy_mask)),
        _mm256_cmpeq_epi64(ab_phone_block, _mm256_and_si256(chain_blocks[1], chain_block_non_dummy_mask)),
        _mm256_cmpeq_epi64(ab_phone_block, _mm256_and_si256(chain_blocks[2], chain_block_non_dummy_mask)),
        _mm256_cmpeq_epi64(ab_phone_block, _mm256_and_si256(chain_blocks[3], chain_block_non_dummy_mask)),
      };

      volatile sabd_lookup_hashed_ab_phones_result_t *chain_results =
        &in_hashed_ab_phones_result[hash_slot_idx * CHAIN_BLOCK_COUNT];

      ab_phone_result.data64[0] |= sabd_lookup_hash_slot_collect_result(chain_results, chain_eq, 0);
      ab_phone_result.data64[1] |= sabd_lookup_hash_slot_collect_result(chain_results, chain_eq, 1);
    }

    in_ab_phones_result[ab_phone_idx] = ab_phone_result;
  }

  // write new dummy values to temporary tables (to force erasure of sensitive data)
  for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
    volatile sabd_lookup_hashed_ab_phones_result_t *chain_results =
      &in_hashed_ab_phones_result[hash_slot_idx * CHAIN_BLOCK_COUNT];
    for (int chain_block_idx = 0; chain_block_idx < CHAIN_BLOCK_COUNT; chain_block_idx++) {
      for (int uuid_idx = 0; uuid_idx < 2; uuid_idx++) {
        volatile __m256i *chain_result = &chain_results[chain_block_idx].uuids[uuid_idx];
        *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
                                         chain_block_dummy_mask);
      }
    }
    volatile __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[hash_slot_idx * chain_length];
    chain_blocks[0] = _mm256_setzero_si256();
    chain_blocks[1] = _mm256_setzero_si256();
    chain_blocks[2] = _mm256_setzero_si256();
    chain_blocks[3] = _mm256_setzero_si256();
  }

  free((void *) in_hashed_ab_phones_result);
  free(hashed_ab_phones);
  return SGX_SUCCESS;
}

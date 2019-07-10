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
#ifndef _SABD_ENCLAVE_H
#define _SABD_ENCLAVE_H

#include "sabd.h"
#include "sgx_error.h"

#define SABD_CACHE_LINE_SIZE 64

sgx_status_t sabd_lookup_hash(const phone_t *in_phones, const uuid_t *in_uuids, size_t in_phone_count,
                              const phone_t *ab_phones, uint32_t ab_phone_count,
                              volatile uuid_t *in_ab_phones_result);

void sabd_ratelimit(sabd_ratelimit_set_t *p_ratelimit_set,
                    uint32_t ratelimit_set_slot_count,
                    phone_t *p_query_phones,
                    const sabd_ratelimit_nonce_t *p_query_nonces,
                    uint8_t *p_query_ratelimited,
                    uint32_t query_phone_count);

#endif

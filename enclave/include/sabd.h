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
#ifndef _SABD_H
#define _SABD_H

#include <stdint.h>
#include <stdlib.h>

#include "sgx_error.h"

typedef uint64_t phone_t;
typedef struct uuid {
    uint64_t data64[2];
} uuid_t;

typedef struct sabd_ratelimit_nonce {
    uint8_t data[32];
} sabd_ratelimit_nonce_t;
_Static_assert(sizeof(sabd_ratelimit_nonce_t) == 32, "Enclave ABI compatibility");

typedef struct sabd_ratelimit_set_element {
    uint8_t hash[24];
} sabd_ratelimit_set_element_t;
_Static_assert(sizeof(sabd_ratelimit_set_element_t) == 24, "Enclave ABI compatibility");

typedef struct sabd_ratelimit_set {
    uint32_t space_remaining;
    sabd_ratelimit_set_element_t slots[];
} sabd_ratelimit_set_t;
_Static_assert(sizeof(sabd_ratelimit_set_t) == sizeof(uint32_t), "Enclave ABI compatibility");

typedef struct sgxsd_server_init_args {
    uint32_t max_ab_phones;
} sgxsd_server_init_args_t, sabd_start_args_t;
_Static_assert(sizeof(sabd_start_args_t) == sizeof(uint32_t), "Enclave ABI compatibility");

typedef struct sgxsd_server_handle_call_args {
    uint32_t ab_phone_count;
    uint32_t ratelimit_set_slot_count;
    sabd_ratelimit_set_t *p_ratelimit_set;
} sgxsd_server_handle_call_args_t, sabd_call_args_t;
_Static_assert(sizeof(sabd_call_args_t) == sizeof(uint32_t) + sizeof(uint32_t) + sizeof(void *), "Enclave ABI compatibility");

typedef struct sgxsd_server_terminate_args {
    phone_t *in_phones;
    size_t  in_phone_count;
    uuid_t  *in_uuids;
} sgxsd_server_terminate_args_t, sabd_stop_args_t;
_Static_assert(sizeof(sabd_stop_args_t) == sizeof(uint64_t) + sizeof(uint64_t) + sizeof(uint64_t), "Enclave ABI compatibility");

//
// error codes
//

typedef enum sabd_status_code {
    SABD_ERROR_INVALID_REQUEST_SIZE = SGX_MK_ERROR(0x20001),
} sabd_status_code_t;

#endif

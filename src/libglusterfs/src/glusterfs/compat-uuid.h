/*
 * Copyright (c) 2015 Red Hat, Inc. <http://www.redhat.com>
 * This file is part of GlusterFS.
 *
 * This file is licensed to you under your choice of the GNU Lesser
 * General Public License, version 3 or any later version (LGPLv3 or
 * later), or the GNU General Public License, version 2 (GPLv2), in all
 * cases as published by the Free Software Foundation.
 */

#ifndef _GF_UUID_H
#define _GF_UUID_H

#ifdef SYLIXOS
#include "uuid.h"
#include <string.h>
#else
#include <uuid/uuid.h>
#endif

static inline void
gf_uuid_clear(uuid_t uuid)
{
    uuid_clear(uuid);
}

static inline int
gf_uuid_compare(uuid_t u1, uuid_t u2)
{
#ifdef SYLIXOS
    /*
     * Bypassing the uuid because it modifies the content of u2.
     */

    int res;

    /* Deal with NULL or equal pointers. */
    if (u1 == u2)
        return (0);
    if (u1 == NULL)
        return (uuid_is_null(u2) ? 0 : -1);
    if (u2 == NULL)
        return (uuid_is_null(u1) ? 0 : 1);

    res = memcmp(u1, u2, sizeof(uuid_t));
    if (res)
        return ((res < 0) ? -1 : 1);
    return (0);
#else
    return uuid_compare(u1, u2);
#endif
}

static inline void
gf_uuid_copy(uuid_t dst, const uuid_t src)
{
    uuid_copy(dst, src);
}

static inline void
gf_uuid_generate(uuid_t uuid)
{
#ifdef SYLIXOS
    /*
     * Using uuid_generate_random will cause the procedure hanged,
     * use uuid_generate_time instead.
     */
    uuid_generate_time(uuid);
#else
    uuid_generate(uuid);
#endif
}

static inline int
gf_uuid_is_null(uuid_t uuid)
{
    return uuid_is_null(uuid);
}

static inline int
gf_uuid_parse(const char *in, uuid_t uuid)
{
    return uuid_parse(in, uuid);
}

static inline void
gf_uuid_unparse(const uuid_t uuid, char *out)
{
    uuid_unparse(uuid, out);
}

/* TODO: add more uuid APIs, use constructs like this:
#if defined(__NetBSD__) * NetBSD libc *

#include <string.h>

static inline void
gf_uuid_clear (uuid_t uuid)
{
        memset (uuid, 0, sizeof (uuid_t));
}
#endif
*/

#endif /* _GF_UUID_H */

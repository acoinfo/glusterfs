#include "compat_sylixos.h"
#include <string.h>
#include <stdlib.h>

int getgrouplist(const char *uname, gid_t agroup, gid_t *groups, int *grpcnt)
{
    struct group *grp;
    int i, ngroups;
    int ret, maxgroups;
    int bail;

    if (!uname || !groups || !grpcnt) {
        return -1;
    }

    ret = 0;
    ngroups = 0;
    maxgroups = *grpcnt;

    /*
     * Install primary group
     */
    if (ngroups >= maxgroups) {
        *grpcnt = ngroups;
        return -1;
    }
    groups[ngroups++] = agroup;

    /*
     * Scan the group file to find additional groups.
     */
    setgrent();
    while ((grp = getgrent())) {
        if (grp->gr_gid == agroup) {
            continue;
        }

        for (bail = 0, i = 0; bail == 0 && i < ngroups; i++) {
            if (groups[i] == grp->gr_gid) {
                bail = 1;
            }
        }

        if (bail) {
            continue;
        }

        for (i = 0; grp->gr_mem[i]; i++) {
            if (!strcmp(grp->gr_mem[i], uname)) {
                if (ngroups >= maxgroups) {
                    ret = -1;
                    goto out;
                }
                groups[ngroups++] = grp->gr_gid;
                break;
            }
        }
    }
out:
    endgrent();
    *grpcnt = ngroups;
    return ret;
}

ssize_t getline(char **lineptr, size_t *n, FILE *stream)
{
    ssize_t len = 0;
    ssize_t capacity = *n;
    char *line = *lineptr;

    if (lineptr == NULL || n == NULL || stream == NULL) {
        return -1;
    }

    while (1) {
        int c = fgetc(stream);
        if (c == EOF) {
            break;
        }

        /* Check if the buffer is full and needs to be resized */
        if (len == capacity - 1) {
            capacity *= 2;
            char *new_line = realloc(line, capacity);
            if (new_line == NULL) {
                return -1;
            }
            line = new_line;
        }

        line[len++] = c;
        if (c == '\n') {
            break;
        }
    }

    line[len] = '\0';
    *lineptr = line;
    *n = capacity;

    if (len == 0 && line[len] == '\0') {
        return -1;
    }

    return len;
}

ssize_t preadv(int fd, const struct iovec *iov, int iovcnt, off_t offset)
{
    ssize_t total_bytes_read = 0;

    if (fd < 0 || iov == NULL || iovcnt < 0 || offset < 0) {
        errno = EINVAL;
        return -1;
    }

    /* Read data into each buffer */
    for (int i = 0; i < iovcnt; i++) {
        ssize_t bytes_read = pread(fd, iov[i].iov_base, iov[i].iov_len, offset);
        if (bytes_read < 0) {
            return -1;
        } else if (bytes_read == 0) {
            /* End of file */
            break;
        }
        total_bytes_read += bytes_read;
        offset += bytes_read;
    }

    return total_bytes_read;
}

ssize_t pwritev(int fd, const struct iovec *iov, int iovcnt, off_t offset)
{
    ssize_t total_bytes_written = 0;
    ssize_t bytes_written = 0;

    if (fd < 0 || iov == NULL || iovcnt < 0 || offset < 0) {
        errno = EINVAL;
        return -1;
    }

    /* Loop over each buffer in the iovec and write it to the file */
    for (int i = 0; i < iovcnt; i++) {
        bytes_written = pwrite(fd, iov[i].iov_base, iov[i].iov_len, offset);
        if (bytes_written < 0) {
            return -1;
        }
        total_bytes_written += bytes_written;
        offset += bytes_written;
    }

    return total_bytes_written;
}

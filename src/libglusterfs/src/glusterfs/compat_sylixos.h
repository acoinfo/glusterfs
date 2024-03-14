#ifndef __COMPAT_SYLIXOS_H
#define __COMPAT_SYLIXOS_H

#include <libgen.h>
#include <grp.h>

/* Define __WORDSIZE, copy from bits/wordsize.h */
#if defined __x86_64__ && !defined __ILP32__
# define __WORDSIZE 64
#else
# define __WORDSIZE 32
#define __WORDSIZE32_SIZE_ULONG     0
#define __WORDSIZE32_PTRDIFF_LONG   0
#endif

#ifdef __x86_64__
# define __WORDSIZE_TIME64_COMPAT32 1
/* Both x86-64 and x32 use the 64-bit system call interface.  */
# define __SYSCALL_WORDSIZE     64
#else
# define __WORDSIZE_TIME64_COMPAT32 0
#endif

#define AT_FDCWD -100
#define UNIX_PATH_MAX PATH_MAX
#define GF_XATTR_NAME_MAX NAME_MAX

#define dprintf fdprintf

#define F_GETLK64 F_GETLK
#define F_SETLK64 F_SETLK
#define F_SETLKW64 F_SETLKW

#ifndef XATTR_CREATE
enum {
    ATTR_CREATE = 1,
#define XATTR_CREATE ATTR_CREATE
    ATTR_REPLACE = 2
#define XATTR_REPLACE ATTR_REPLACE
};
#endif

#ifndef AT_SYMLINK_NOFOLLOW
#define AT_SYMLINK_NOFOLLOW 0x100
#endif

#define ST_ATIM_SEC(stbuf) ((stbuf)->st_atime)
#define ST_MTIM_SEC(stbuf) ((stbuf)->st_mtime)

#define CLOCK_REALTIME_COARSE CLOCK_REALTIME

typedef unsigned long mount_flag_t;

#ifndef _PATH_UMOUNT
#define _PATH_UMOUNT "/bin/umount"
#endif

#ifndef _PATH_SETFATTR
#define _PATH_SETFATTR "setfattr"
#endif

/* Macros for converting between `struct timeval' and `struct timespec'.  */
#define TIMEVAL_TO_TIMESPEC(tv, ts) {                               \
    (ts)->tv_sec = (tv)->tv_sec;                                    \
    (ts)->tv_nsec = (tv)->tv_usec * 1000;                           \
}
#define TIMESPEC_TO_TIMEVAL(tv, ts) {                               \
    (tv)->tv_sec = (ts)->tv_sec;                                    \
    (tv)->tv_usec = (ts)->tv_nsec / 1000;                           \
}

/* sylixos io vector wrapper */
struct fuse_iov_wrapper {
    int             count;
    struct iovec   *iov;
};

int getgrouplist(const char *uname, gid_t agroup, gid_t *groups, int *grpcnt);

ssize_t getline(char **lineptr, size_t *n, FILE *stream);

ssize_t preadv(int fd, const struct iovec *iov, int iovcnt, off_t offset);

ssize_t pwritev(int fd, const struct iovec *iov, int iovcnt, off_t offset);

#endif

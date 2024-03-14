#*********************************************************************************************************
#
#                                    中国软件开源组织
#
#                                   嵌入式实时操作系统
#
#                                SylixOS(TM)  LW : long wing
#
#                               Copyright All Rights Reserved
#
#--------------文件信息--------------------------------------------------------------------------------
#
# 文   件   名: libglusterfs.mk
#
# 创   建   人: RealEvo-IDE
#
# 文件创建日期: 2023 年 03 月 01 日
#
# 描        述: 本文件由 RealEvo-IDE 生成，用于配置 Makefile 功能，请勿手动修改
#*********************************************************************************************************

#*********************************************************************************************************
# Clear setting
#*********************************************************************************************************
include $(CLEAR_VARS_MK)

#*********************************************************************************************************
# Target
#*********************************************************************************************************
LOCAL_TARGET_NAME := libglusterfs.so

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS :=  \
src/libglusterfs/src/async.c \
src/contrib/libgen/basename_r.c \
src/libglusterfs/src/call-stub.c \
src/libglusterfs/src/checksum.c \
src/libglusterfs/src/circ-buff.c \
src/libglusterfs/src/client_t.c \
src/libglusterfs/src/cluster-syncop.c \
src/libglusterfs/src/common-utils.c \
src/libglusterfs/src/compat-errno.c \
src/libglusterfs/src/compat.c \
src/libglusterfs/src/ctx.c \
src/libglusterfs/src/daemon.c \
src/libglusterfs/src/default-args.c \
src/libglusterfs/src/defaults.c \
src/libglusterfs/src/dict.c \
src/libglusterfs/src/event-epoll.c \
src/libglusterfs/src/event-history.c \
src/libglusterfs/src/event.c \
src/libglusterfs/src/event-poll.c \
src/libglusterfs/src/events.c \
src/libglusterfs/src/fd-lk.c \
src/libglusterfs/src/fd.c \
src/libglusterfs/src/gf-dirent.c \
src/libglusterfs/src/gf-io-common.c \
src/libglusterfs/src/gf-io-legacy.c \
src/libglusterfs/src/gf-io.c \
src/libglusterfs/src/gidcache.c \
src/libglusterfs/src/globals.c \
src/libglusterfs/src/graph.lex.c \
src/libglusterfs/src/graph.c \
src/libglusterfs/src/graph-print.c \
src/libglusterfs/src/hashfn.c \
src/libglusterfs/src/inode.c \
src/libglusterfs/src/iobuf.c \
src/libglusterfs/src/latency.c \
src/libglusterfs/src/logging.c \
src/libglusterfs/src/mem-pool.c \
src/libglusterfs/src/monitoring.c \
src/libglusterfs/src/options.c \
src/libglusterfs/src/parse-utils.c \
src/libglusterfs/src/quota-common-utils.c \
src/libglusterfs/src/rbthash.c \
src/libglusterfs/src/refcount.c \
src/libglusterfs/src/rot-buffs.c \
src/libglusterfs/src/run.c \
src/libglusterfs/src/stack.c \
src/libglusterfs/src/statedump.c \
src/libglusterfs/src/store.c \
src/libglusterfs/src/strfd.c \
src/libglusterfs/src/syncop.c \
src/libglusterfs/src/syncop-utils.c \
src/libglusterfs/src/syscall.c \
src/libglusterfs/src/throttle-tbf.c \
src/libglusterfs/src/timer.c \
src/libglusterfs/src/timespec.c \
src/libglusterfs/src/trie.c \
src/libglusterfs/src/xlator.c \
src/libglusterfs/src/y.tab.c \
src/libglusterfs/src/compat_sylixos.c \
src/contrib/libgen/dirname_r.c \
src/contrib/libexecinfo/execinfo.c \
src/contrib/mount/mntent.c \
src/contrib/rbtree/rb.c \
src/contrib/timer-wheel/timer-wheel.c \
src/contrib/timer-wheel/find_last_bit.c \
src/contrib/xxhash/xxhash.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your header files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := \
-I"src/config_sylixos" \
-include "src/config_sylixos/config.h" \
-include "src/config_sylixos/site.h" \
-I"src/libglusterfs/src/glusterfs" \
-I"src/libglusterfs/src" \
-I"$(SYLIXOS_BASE_PATH)/openssl/openssl/include" \
-I"$(WORKSPACE_liburcu)/src/include" \
-I"$(WORKSPACE_libuuid)/src" \
-I"$(WORKSPACE_libucontext)/src/include" \
-I"$(WORKSPACE_libucontext)/src/arch/$(UCONTEXT_ARCH)/include" \
-I"$(WORKSPACE_libargp)/src/include" \
-I"src/contrib/rbtree" \
-I"src/contrib/xxhash" \
-I"src/contrib/libexecinfo" \
-I"src/contrib/timer-wheel" \
-I"src/contrib/fuse-include"

#*********************************************************************************************************
# Pre-defined macro (eg. -DYOUR_MARCO=1)
#*********************************************************************************************************
LOCAL_DSYMBOL := \
-DHAVE_CONFIG_H \
-D_GNU_SOURCE \
-D_FILE_OFFSET_BITS=64 \
-D__USE_FILE_OFFSET64 \
-D__USE_LARGEFILE64 \
-DXXH_NAMESPACE=GF_SYLIXOS \
-DUATOMIC_NO_LINK_ERROR

#*********************************************************************************************************
# Compiler flags
#*********************************************************************************************************
LOCAL_CFLAGS   := -Wformat -Werror=format-security -Werror=implicit-function-declaration $(LTO)
LOCAL_CXXFLAGS :=
LOCAL_LINKFLAGS := -fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free

#*********************************************************************************************************
# Depend library (eg. LOCAL_DEPEND_LIB := -la LOCAL_DEPEND_LIB_PATH := -L"Your library search path")
#*********************************************************************************************************
LOCAL_DEPEND_LIB      := -luuid -lurcu-common -lurcu-bp -lurcu-cds -lcrypto -lucontext -largp
LOCAL_DEPEND_LIB_PATH := \
-L"$(WORKSPACE_libuuid)/$(Output)" \
-L"$(WORKSPACE_liburcu)/$(Output)" \
-L"$(SYLIXOS_BASE_PATH)/openssl/$(Output)" \
-L"$(WORKSPACE_libucontext)/$(Output)" \
-L"$(WORKSPACE_libargp)/$(Output)"

#*********************************************************************************************************
# C++ config
#*********************************************************************************************************
LOCAL_USE_CXX        := no
LOCAL_USE_CXX_EXCEPT := no

#*********************************************************************************************************
# Code coverage config
#*********************************************************************************************************
LOCAL_USE_GCOV := no

#*********************************************************************************************************
# OpenMP config
#*********************************************************************************************************
LOCAL_USE_OMP := no

#*********************************************************************************************************
# Use short command for link and ar
#*********************************************************************************************************
LOCAL_USE_SHORT_CMD := no

#*********************************************************************************************************
# User link command
#*********************************************************************************************************
LOCAL_PRE_LINK_CMD   :=
LOCAL_POST_LINK_CMD  :=
LOCAL_PRE_STRIP_CMD  :=
LOCAL_POST_STRIP_CMD :=

#*********************************************************************************************************
# Depend target
#*********************************************************************************************************
LOCAL_DEPEND_TARGET :=

include $(LIBRARY_MK)

#*********************************************************************************************************
# End
#*********************************************************************************************************

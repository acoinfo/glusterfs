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
# 文   件   名: xlators-mgmt-glusterd.mk
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
LOCAL_TARGET_NAME := glusterd.so

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS :=  \
src/xlators/mgmt/glusterd/src/glusterd.c \
src/xlators/mgmt/glusterd/src/glusterd-handler.c \
src/xlators/mgmt/glusterd/src/glusterd-sm.c \
src/xlators/mgmt/glusterd/src/glusterd-op-sm.c \
src/xlators/mgmt/glusterd/src/glusterd-utils.c \
src/xlators/mgmt/glusterd/src/glusterd-rpc-ops.c \
src/xlators/mgmt/glusterd/src/glusterd-store.c \
src/xlators/mgmt/glusterd/src/glusterd-handshake.c \
src/xlators/mgmt/glusterd/src/glusterd-pmap.c \
src/xlators/mgmt/glusterd/src/glusterd-volgen.c \
src/xlators/mgmt/glusterd/src/glusterd-rebalance.c \
src/xlators/mgmt/glusterd/src/glusterd-quota.c \
src/xlators/mgmt/glusterd/src/glusterd-bitrot.c \
src/xlators/mgmt/glusterd/src/glusterd-geo-rep.c \
src/xlators/mgmt/glusterd/src/glusterd-replace-brick.c \
src/xlators/mgmt/glusterd/src/glusterd-log-ops.c \
src/xlators/mgmt/glusterd/src/glusterd-volume-ops.c \
src/xlators/mgmt/glusterd/src/glusterd-brick-ops.c \
src/xlators/mgmt/glusterd/src/glusterd-mountbroker.c \
src/xlators/mgmt/glusterd/src/glusterd-syncop.c \
src/xlators/mgmt/glusterd/src/glusterd-hooks.c \
src/xlators/mgmt/glusterd/src/glusterd-volume-set.c \
src/xlators/mgmt/glusterd/src/glusterd-locks.c \
src/xlators/mgmt/glusterd/src/glusterd-snapshot.c \
src/xlators/mgmt/glusterd/src/glusterd-mgmt-handler.c \
src/xlators/mgmt/glusterd/src/glusterd-mgmt.c \
src/xlators/mgmt/glusterd/src/glusterd-peer-utils.c \
src/xlators/mgmt/glusterd/src/glusterd-statedump.c \
src/xlators/mgmt/glusterd/src/glusterd-snapshot-utils.c \
src/xlators/mgmt/glusterd/src/glusterd-conn-mgmt.c \
src/xlators/mgmt/glusterd/src/glusterd-proc-mgmt.c \
src/xlators/mgmt/glusterd/src/glusterd-svc-mgmt.c \
src/xlators/mgmt/glusterd/src/glusterd-nfs-svc.c \
src/xlators/mgmt/glusterd/src/glusterd-quotad-svc.c \
src/xlators/mgmt/glusterd/src/glusterd-svc-helper.c \
src/xlators/mgmt/glusterd/src/glusterd-conn-helper.c \
src/xlators/mgmt/glusterd/src/glusterd-snapd-svc.c \
src/xlators/mgmt/glusterd/src/glusterd-snapd-svc-helper.c \
src/xlators/mgmt/glusterd/src/glusterd-bitd-svc.c \
src/xlators/mgmt/glusterd/src/glusterd-scrub-svc.c \
src/xlators/mgmt/glusterd/src/glusterd-server-quorum.c \
src/xlators/mgmt/glusterd/src/glusterd-reset-brick.c \
src/xlators/mgmt/glusterd/src/glusterd-shd-svc.c \
src/xlators/mgmt/glusterd/src/glusterd-shd-svc-helper.c \
src/xlators/mgmt/glusterd/src/glusterd-gfproxyd-svc.c \
src/xlators/mgmt/glusterd/src/glusterd-gfproxyd-svc-helper.c \
src/xlators/mgmt/glusterd/src/glusterd-ganesha.c \
src/contrib/mount/mntent.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your header files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := \
-I"src/config_sylixos" \
-include "src/config_sylixos/config.h" \
-include "src/config_sylixos/site.h" \
-I"src/libglusterfs/src" \
-I"src/libglusterfs/src/glusterfs" \
-I"src/libglusterd/src" \
-I"src/rpc/rpc-lib/src" \
-I"src/rpc/xdr/src" \
-I"src/contrib/rb-tree" \
-I"src/contrib/mount" \
-I"src/contrib/userspace-rcu" \
-I"$(SYLIXOS_BASE_PATH)/openssl/openssl/include" \
-I"$(WORKSPACE_liburcu)/src/include" \
-I"$(WORKSPACE_libuuid)/src" \
-I"$(WORKSPACE_libucontext)/src/include" \
-I"$(WORKSPACE_libucontext)/src/arch/$(UCONTEXT_ARCH)/include" \
-I"$(WORKSPACE_libargp)/src/include" \
-I"$(SYLIXOS_BASE_PATH)/libsunrpc/sunrpc" \
-I"$(WORKSPACE_libxml2)/libxml2-v2.9.10/include"

#*********************************************************************************************************
# Pre-defined macro (eg. -DYOUR_MARCO=1)
#*********************************************************************************************************
LOCAL_DSYMBOL := \
-DHAVE_CONFIG_H \
-D_GNU_SOURCE \
-D_FILE_OFFSET_BITS=64 \
-DSYNCDAEMON_COMPILE=0

#*********************************************************************************************************
# Compiler flags
#*********************************************************************************************************
LOCAL_CFLAGS   := -Wformat -Werror=format-security -Werror=implicit-function-declaration $(LTO)
LOCAL_CXXFLAGS :=
LOCAL_LINKFLAGS := -Wl,-rpath="/lib/glusterfs/xlator/mgmt"

#*********************************************************************************************************
# Depend library (eg. LOCAL_DEPEND_LIB := -la LOCAL_DEPEND_LIB_PATH := -L"Your library search path")
#*********************************************************************************************************
LOCAL_DEPEND_LIB      := \
-lglusterfs $(TIRPC) -luuid -lurcu-bp -lurcu-common \
-lurcu-cds -lcrypto -lucontext -largp -lgfrpc -lgfxdr -lxml2 -lglusterd
LOCAL_DEPEND_LIB_PATH := \
-L"$(WORKSPACE_glusterfs)/$(Output)" \
-L"$(SYLIXOS_BASE_PATH)/libsunrpc/$(Output)" \
-L"$(WORKSPACE_libuuid)/$(Output)" \
-L"$(WORKSPACE_liburcu)/$(Output)" \
-L"$(SYLIXOS_BASE_PATH)/openssl/$(Output)" \
-L"$(WORKSPACE_libucontext)/$(Output)" \
-L"$(WORKSPACE_libargp)/$(Output)" \
-L"$(WORKSPACE_libxml2)/$(Output)"

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
LOCAL_DEPEND_TARGET := $(OUTDIR)/libglusterfs.so $(OUTDIR)/libgfrpc.so $(OUTDIR)/libgfxdr.so $(OUTDIR)/libglusterd.so

include $(LIBRARY_MK)

#*********************************************************************************************************
# End
#*********************************************************************************************************

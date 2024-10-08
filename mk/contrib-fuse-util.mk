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
# 文   件   名: contrib-fuse-util.mk
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
LOCAL_TARGET_NAME := fusermount-glusterfs

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS :=  \
src/contrib/fuse-util/fusermount.c \
src/contrib/fuse-util/mount_util.c \
src/contrib/fuse-lib/mount-common.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your header files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := \
-I"src/config_sylixos" \
-include "src/config_sylixos/config.h" \
-include "src/config_sylixos/site.h" \
-I"src/libglusterfs/src" \
-I"src/rpc/rpc-lib/src" \
-I"src/rpc/xdr/src" \
-I"src/contrib/fuse-include" \
-I"src/contrib/fuse-lib" \
-I"src/contrib/mount" \
-I"$(SYLIXOS_BASE_PATH)/openssl/openssl/include" \
-I"$(WORKSPACE_liburcu)/src/include" \
-I"$(WORKSPACE_libuuid)/src" \
-I"$(WORKSPACE_libucontext)/src/include" \
-I"$(WORKSPACE_libucontext)/src/arch/$(UCONTEXT_ARCH)/include" \
-I"$(WORKSPACE_libargp)/src/include" \
-I"$(SYLIXOS_BASE_PATH)/libsunrpc/sunrpc"

#*********************************************************************************************************
# Pre-defined macro (eg. -DYOUR_MARCO=1)
#*********************************************************************************************************
LOCAL_DSYMBOL := \
-DHAVE_CONFIG_H \
-D_GNU_SOURCE \
-D_FILE_OFFSET_BITS=64 \
-DFUSE_UITL

#*********************************************************************************************************
# Compiler flags
#*********************************************************************************************************
LOCAL_CFLAGS   := -Wformat -Werror=format-security -Werror=implicit-function-declaration $(LTO)
LOCAL_CXXFLAGS :=
LOCAL_LINKFLAGS :=

#*********************************************************************************************************
# Depend library (eg. LOCAL_DEPEND_LIB := -la LOCAL_DEPEND_LIB_PATH := -L"Your library search path")
#*********************************************************************************************************
LOCAL_DEPEND_LIB      := -lglusterfs $(TIRPC) -luuid -lcrypto -lucontext -largp -lgfrpc -lgfxdr -lgfapi
LOCAL_DEPEND_LIB_PATH := \
-L"$(WORKSPACE_glusterfs)/$(Output)" \
-L"$(SYLIXOS_BASE_PATH)/libsunrpc/$(Output)" \
-L"$(WORKSPACE_libuuid)/$(Output)" \
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
LOCAL_DEPEND_TARGET := $(OUTDIR)/libglusterfs.so $(OUTDIR)/libgfrpc.so $(OUTDIR)/libgfxdr.so $(OUTDIR)/libgfapi.so

include $(APPLICATION_MK)

#*********************************************************************************************************
# End
#*********************************************************************************************************

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
# 文   件   名: xlators-features-compress.mk
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
LOCAL_TARGET_NAME := compress.so

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS :=  \
src/xlators/features/compress/src/cdc.c \
src/xlators/features/compress/src/cdc-helper.c

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
-D_FILE_OFFSET_BITS=64

#*********************************************************************************************************
# Compiler flags
#*********************************************************************************************************
LOCAL_CFLAGS   := -Wformat -Werror=format-security -Werror=implicit-function-declaration $(LTO)
LOCAL_CXXFLAGS :=
LOCAL_LINKFLAGS := -Wl,-rpath="/lib/glusterfs/xlator/features"

#*********************************************************************************************************
# Depend library (eg. LOCAL_DEPEND_LIB := -la LOCAL_DEPEND_LIB_PATH := -L"Your library search path")
#*********************************************************************************************************
LOCAL_DEPEND_LIB      := \
-lglusterfs $(TIRPC) -luuid -lurcu-bp -lurcu-common \
-lurcu-cds -lcrypto -lucontext -largp -lgfrpc -lgfxdr
LOCAL_DEPEND_LIB_PATH := \
-L"$(WORKSPACE_glusterfs)/$(Output)" \
-L"$(SYLIXOS_BASE_PATH)/libsunrpc/$(Output)" \
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
LOCAL_DEPEND_TARGET := $(OUTDIR)/libglusterfs.so $(OUTDIR)/libgfrpc.so $(OUTDIR)/libgfxdr.so

include $(LIBRARY_MK)

#*********************************************************************************************************
# End
#*********************************************************************************************************

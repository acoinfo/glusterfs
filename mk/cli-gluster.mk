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
# 文   件   名: cli-gluster.mk
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
LOCAL_TARGET_NAME := gluster

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS :=  \
src/cli/src/cli.c \
src/cli/src/registry.c \
src/cli/src/input.c \
src/cli/src/cli-cmd.c \
src/cli/src/cli-rl.c \
src/cli/src/cli-cmd-global.c \
src/cli/src/cli-cmd-volume.c \
src/cli/src/cli-cmd-peer.c \
src/cli/src/cli-rpc-ops.c \
src/cli/src/cli-cmd-parser.c \
src/cli/src/cli-cmd-system.c \
src/cli/src/cli-cmd-misc.c \
src/cli/src/cli-xml-output.c \
src/cli/src/cli-quotad-client.c \
src/cli/src/cli-cmd-snapshot.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your header files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := \
-I"src/config_sylixos" \
-include "src/config_sylixos/config.h" \
-include "src/config_sylixos/site.h" \
-I"src/libglusterfs/src" \
-I"src/libglusterd/src" \
-I"src/rpc/rpc-lib/src" \
-I"src/rpc/xdr/src" \
-I"src/xlators/nfs/server/src" \
-I"src/xlators/protocol/server/src" \
-I"$(SYLIXOS_BASE_PATH)/openssl/openssl/include" \
-I"$(WORKSPACE_liburcu)/src/include" \
-I"$(WORKSPACE_libuuid)/src" \
-I"$(WORKSPACE_libucontext)/src/include" \
-I"$(WORKSPACE_libucontext)/src/arch/$(UCONTEXT_ARCH)/include" \
-I"$(WORKSPACE_libargp)/src/include" \
-I"$(SYLIXOS_BASE_PATH)/libsunrpc/sunrpc" \
-I"$(WORKSPACE_libxml2)/libxml2-v2.9.10/include" \
-I"$(SYLIXOS_BASE_PATH)/libreadline"

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
LOCAL_LINKFLAGS :=

#*********************************************************************************************************
# Depend library (eg. LOCAL_DEPEND_LIB := -la LOCAL_DEPEND_LIB_PATH := -L"Your library search path")
#*********************************************************************************************************
LOCAL_DEPEND_LIB      := -lglusterfs -lglusterd $(TIRPC) -luuid -lcrypto -lucontext -largp -lgfrpc -lgfxdr \
-lxml2 -lreadline
LOCAL_DEPEND_LIB_PATH := \
-L"$(WORKSPACE_glusterfs)/$(Output)" \
-L"$(SYLIXOS_BASE_PATH)/libsunrpc/$(Output)" \
-L"$(WORKSPACE_libuuid)/$(Output)" \
-L"$(SYLIXOS_BASE_PATH)/openssl/$(Output)" \
-L"$(WORKSPACE_libucontext)/$(Output)" \
-L"$(WORKSPACE_libargp)/$(Output)" \
-L"$(WORKSPACE_libxml2)/$(Output)" \
-L"$(SYLIXOS_BASE_PATH)/libreadline/$(Output)"

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

include $(APPLICATION_MK)

#*********************************************************************************************************
# End
#*********************************************************************************************************

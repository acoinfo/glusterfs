#*********************************************************************************************************
#
#                                    �й������Դ��֯
#
#                                   Ƕ��ʽʵʱ����ϵͳ
#
#                                SylixOS(TM)  LW : long wing
#
#                               Copyright All Rights Reserved
#
#--------------�ļ���Ϣ--------------------------------------------------------------------------------
#
# ��   ��   ��: xlators-meta.mk
#
# ��   ��   ��: RealEvo-IDE
#
# �ļ���������: 2023 �� 03 �� 01 ��
#
# ��        ��: ���ļ��� RealEvo-IDE ���ɣ��������� Makefile ���ܣ������ֶ��޸�
#*********************************************************************************************************

#*********************************************************************************************************
# Clear setting
#*********************************************************************************************************
include $(CLEAR_VARS_MK)

#*********************************************************************************************************
# Target
#*********************************************************************************************************
LOCAL_TARGET_NAME := meta.so

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS :=  \
src/xlators/meta/src/meta.c \
src/xlators/meta/src/meta-helpers.c \
src/xlators/meta/src/meta-defaults.c \
src/xlators/meta/src/root-dir.c \
src/xlators/meta/src/graphs-dir.c \
src/xlators/meta/src/frames-file.c \
src/xlators/meta/src/graph-dir.c \
src/xlators/meta/src/active-link.c \
src/xlators/meta/src/xlator-dir.c \
src/xlators/meta/src/top-link.c \
src/xlators/meta/src/logging-dir.c \
src/xlators/meta/src/logfile-link.c \
src/xlators/meta/src/loglevel-file.c \
src/xlators/meta/src/process_uuid-file.c \
src/xlators/meta/src/volfile-file.c \
src/xlators/meta/src/view-dir.c \
src/xlators/meta/src/subvolumes-dir.c \
src/xlators/meta/src/subvolume-link.c \
src/xlators/meta/src/type-file.c \
src/xlators/meta/src/version-file.c \
src/xlators/meta/src/options-dir.c \
src/xlators/meta/src/option-file.c \
src/xlators/meta/src/cmdline-file.c \
src/xlators/meta/src/name-file.c \
src/xlators/meta/src/private-file.c \
src/xlators/meta/src/history-file.c \
src/xlators/meta/src/mallinfo-file.c \
src/xlators/meta/src/meminfo-file.c \
src/xlators/meta/src/measure-file.c \
src/xlators/meta/src/profile-file.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your header files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := \
-I"src/config_sylixos" \
-include "src/config_sylixos/config.h" \
-include "src/config_sylixos/site.h" \
-I"src/libglusterfs/src" \
-I"src/libglusterfs/src/glusterfs" \
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
LOCAL_LINKFLAGS := -Wl,-rpath="/lib/glusterfs/xlator"

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

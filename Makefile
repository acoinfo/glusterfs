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
# 文   件   名: Makefile
#
# 创   建   人: RealEvo-IDE
#
# 文件创建日期: 2023 年 03 月 01 日
#
# 描        述: 本文件由 RealEvo-IDE 生成，用于配置 Makefile 功能，请勿手动修改
#*********************************************************************************************************

#*********************************************************************************************************
# Include config.mk
#*********************************************************************************************************
CONFIG_MK_EXIST = $(shell if [ -f ../config.mk ]; then echo exist; else echo notexist; fi;)
ifeq ($(CONFIG_MK_EXIST), exist)
include ../config.mk
else
CONFIG_MK_EXIST = $(shell if [ -f config.mk ]; then echo exist; else echo notexist; fi;)
ifeq ($(CONFIG_MK_EXIST), exist)
include config.mk
else
CONFIG_MK_EXIST =
endif
endif

#*********************************************************************************************************
# Include sylixos base config.mk
#*********************************************************************************************************
EMPTY =
SPACE = $(EMPTY) $(EMPTY)

SYLIXOS_BASE_PATH_BAK := $(SYLIXOS_BASE_PATH)
TOOLCHAIN_PREFIX_BAK  := $(TOOLCHAIN_PREFIX)
DEBUG_LEVEL_BAK       := $(DEBUG_LEVEL)
CPU_TYPE_BAK          := $(CPU_TYPE)
FPU_TYPE_BAK          := $(FPU_TYPE)

SYLIXOS_BASE_CONFIGMK = $(subst $(SPACE),\ ,$(SYLIXOS_BASE_PATH))/config.mk
include $(SYLIXOS_BASE_CONFIGMK)

SYLIXOS_BASE_PATH := $(SYLIXOS_BASE_PATH_BAK)
DEBUG_LEVEL       := $(DEBUG_LEVEL_BAK)

ifneq ($(TOOLCHAIN_PREFIX_BAK),)
TOOLCHAIN_PREFIX := $(TOOLCHAIN_PREFIX_BAK)
endif

ifneq ($(CPU_TYPE_BAK),)
CPU_TYPE := $(CPU_TYPE_BAK)
endif

ifneq ($(FPU_TYPE_BAK),)
FPU_TYPE := $(FPU_TYPE_BAK)
endif

#*********************************************************************************************************
# Include header.mk
#*********************************************************************************************************
MKTEMP = $(subst $(SPACE),\ ,$(SYLIXOS_BASE_PATH))/libsylixos/SylixOS/mktemp

include $(MKTEMP)/header.mk

#*********************************************************************************************************
# Include targets makefiles
#*********************************************************************************************************
ifeq ($(ARCH), arm)
UCONTEXT_ARCH			:= arm
endif

ifeq ($(ARCH), arm64)
UCONTEXT_ARCH			:= aarch64
endif

ifeq ($(ARCH), mips)
UCONTEXT_ARCH			:= mips
endif

ifeq ($(ARCH), mips64)
UCONTEXT_ARCH			:= mips64
endif

ifeq ($(ARCH), ppc)
UCONTEXT_ARCH			:= ppc
endif

ifeq ($(ARCH), x86)
UCONTEXT_ARCH			:= x86
endif

ifeq ($(ARCH), x64)
UCONTEXT_ARCH			:= x86_64
endif

ifeq ($(ARCH), riscv)
UCONTEXT_ARCH			:= riscv64
endif

ifeq ($(ARCH), loongarch64)
UCONTEXT_ARCH			:= loongarch64
endif

# libglusterfs
include mk/libglusterfs.mk
# RPC
include mk/rpc-libgfxdr.mk
include mk/rpc-libgfrpc.mk
include mk/rpc-socket.mk
# libglusterd
include mk/libglusterd.mk
# api
include mk/api-libgfapi.mk
include mk/api-api.mk
# glusterfsd
include mk/glusterfsd-glusterfsd.mk
include mk/glusterfsd-gf_attach.mk
# xlatros
# xlatros/cluster
include mk/xlators-cluster-afr.mk
include mk/xlators-cluster-dht.mk
include mk/xlators-cluster-dht-nufa.mk
include mk/xlators-cluster-dht-switch.mk
include mk/xlators-cluster-ec.mk
# xlatros/storage
include mk/xlators-storage-posix.mk
# xlatros/protocol
include mk/xlators-protocol-auth-addr.mk
include mk/xlators-protocol-auth-login.mk
include mk/xlators-protocol-client.mk
include mk/xlators-protocol-server.mk
# xlatros/performannce
include mk/xlators-performance-write-behind.mk
include mk/xlators-performance-read-ahead.mk
include mk/xlators-performance-readdir-ahead.mk
include mk/xlators-performance-io-threads.mk
include mk/xlators-performance-io-cache.mk
include mk/xlators-performance-quick-read.mk
include mk/xlators-performance-md-cache.mk
include mk/xlators-performance-open-behind.mk
include mk/xlators-performance-nl-cache.mk
# xlatros/debug
include mk/xlators-debug-error-gen.mk
include mk/xlators-debug-io-stats.mk
include mk/xlators-debug-sink.mk
include mk/xlators-debug-trace.mk
include mk/xlators-debug-delay-gen.mk
# xlatros/features
include mk/xlators-features-locks.mk
include mk/xlators-features-quota.mk
include mk/xlators-features-quotad.mk
include mk/xlators-features-read-only.mk
include mk/xlators-features-read-only-worm.mk
include mk/xlators-features-quiesce.mk
include mk/xlators-features-marker.mk
include mk/xlators-features-index.mk
include mk/xlators-features-barrier.mk
include mk/xlators-features-arbiter.mk
include mk/xlators-features-upcall.mk
include mk/xlators-features-compress.mk
include mk/xlators-features-changelog.mk
include mk/xlators-features-changelog-lib.mk
include mk/xlators-features-gfid-access.mk
include mk/xlators-features-snapview-client.mk
include mk/xlators-features-snapview-server.mk
include mk/xlators-features-trash.mk
include mk/xlators-features-shard.mk
include mk/xlators-features-bit-rot-stub.mk
include mk/xlators-features-bit-rot-bitd.mk
include mk/xlators-features-leases.mk
include mk/xlators-features-selinux.mk
include mk/xlators-features-sdfs.mk
include mk/xlators-features-namespace.mk
include mk/xlators-features-cloudsync-plugin-cloudsyncs3.mk
include mk/xlators-features-cloudsync-plugin-cvlt.mk
include mk/xlators-features-cloudsync.mk
include mk/xlators-features-thin-arbiter.mk
include mk/xlators-features-utime.mk
# xlatros/mount
include mk/xlators-mount-fuse.mk
# xlatros/mgmt
include mk/xlators-mgmt-glusterd.mk
# xlatros/system
include mk/xlators-system-posix-acl.mk
# xlatros/playground
include mk/xlators-playground-template.mk
# xlatros/meta
include mk/xlators-meta.mk
# contrib/fuse-util
include mk/contrib-fuse-util.mk
# doc
# extras
# cli
include mk/cli-gluster.mk
# heal
include mk/heal-glfsheal.mk
# tools
include mk/tools-gcrawler.mk
include mk/tools-gluster-setfgid2path.mk
# events


#*********************************************************************************************************
# Include end.mk
#*********************************************************************************************************
include $(END_MK)

#*********************************************************************************************************
# End
#*********************************************************************************************************

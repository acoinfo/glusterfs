#*********************************************************************************************************
#
#                                    �й�������Դ��֯
#
#                                   Ƕ��ʽʵʱ����ϵͳ
#
#                                SylixOS(TM)  LW : long wing
#
#                               Copyright All Rights Reserved
#
#--------------�ļ���Ϣ--------------------------------------------------------------------------------
#
# ��   ��   ��: config.mk
#
# ��   ��   ��: RealEvo-IDE
#
# �ļ���������: 2023 �� 03 �� 01 ��
#
# ��        ��: ���ļ��� RealEvo-IDE ���ɣ��������� Makefile ���ܣ������ֶ��޸�
#*********************************************************************************************************

#*********************************************************************************************************
# SylixOS Base Project path
#*********************************************************************************************************
SYLIXOS_BASE_PATH := D:\Project\Base\research-base-arm64

#*********************************************************************************************************
# Debug options (debug or release)
#*********************************************************************************************************
DEBUG_LEVEL := release

#*********************************************************************************************************
# Custom options
#*********************************************************************************************************
# configure cmd: configure --prefix=$PWD/../install --disable-linux-io_uring --disable-selinux --disable-georeplication --without-tcmalloc --disable-georeplication
LTO :=
ACL :=
TIRPC :=

#*********************************************************************************************************
# End
#*********************************************************************************************************
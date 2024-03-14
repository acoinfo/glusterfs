# GlusterFS

Gluster is a software defined distributed storage that can scale to several petabytes. It provides interfaces for object, block and file storage.

Version: 10.3

Repo: https://github.com/gluster/glusterfs

## 构建

依赖库 | 来源 | 备注
| - | - | - |
libuuid | Middleware 仓库
liburcu | Middleware 仓库
libucontext | Middleware 仓库
libargp | Middleware 仓库
libxml2 | Middleware 仓库
openssl | Base 组件 | 如果开发环境版本低于 IDE 5.0.5，请将 openssl 替换为 Middleware 仓库中的版本
libcurl | Base 组件 | 优先检测 Base 路径下的库，否则会使用工作空间下的库
libsunrpc | Base 组件
libreadline | Base 组件

## 支持的架构

常用架构 arm/aarch64/mips64/x86/x64/loongarch 均能使用。

## 使用说明

部署动态库：使用 ALT + D
部署配置文件：使用 ALT + X

首次部署后请在设备中运行 `shfile /etc/glusterfs/mklink_glusterfs.sh`

关于 GlusterFS 的操作请参考[官方文档](https://docs.gluster.org/en/latest/)，以下仅对基本的操作进行介绍。

### 使用注意事项

类别 | 记录
| - | - |
服务端 | 依赖接口 xattr / hard-link / telldir / seekdir, 请确认使用的内核版本是否支持以上特性
\- | LW_CFG_FS_XATTR_EN 默认为关闭状态，需要在内核 fs_cfg.h 中将其打开
\- | setrlimit 参数未生效，需要将内核的 system_cfg.h 中 LW_CFG_MAX_FILES 配置为 65535
\- | gluster 会占用较多的 event 资源，默认情况下 5000 的数量只能满足启动一个卷的场景，如果需要开启多个卷，请调整 kernel_cfg.h 中的 LW_CFG_MAX_EVENTS
\- | gluster probe 建立过程中会用到 getnameinfo 接口，请提前配置 DNS 服务，否则会因超时导致该流程耗时较长
客户端 | 依赖于 FUSE, 请确认使用的内核版本是否支持以上特性

### 服务端

运行服务端:
```
glusterd -p /var/run/glusterd.pid
```

添加远端服务器:
```
gluster peer probe <remote-server ip>
```

查看远端服务器状态:
```
gluster peer status
or
gluster pool list
```

创建卷:
```
gluster vol create [volume-type] <volume-name> <ip1:volume1> <ip2:volume2>
```

启动卷:
```
gluster vol start <volume-name>
```

### 客户端

挂载命令:

```
glusterfs --process-name fuse --volfile-server=<server-ip> --volfile-id=<volume-name> /mnt/glusterfs
```

目前 write-behind 功能暂不支持，请在服务端关闭该特性

```
gluster vol set <volume-name> performance.write-behind off
```

如果需要使用分布式卷（Distributed Volume），请在服务端设置开启 readdir-ahead 功能。（由于 SylixOS 的 readdir 使用方式不同，此处在 Fuse 中进行了特殊处理）

配置命令

```
gluster vol set <volume-name> performance.readdir-ahead on
```

## 已知问题

- 在连续 WRITE 操作 64K 数据时，存在卡死问题，在 AArch64 和 MIPS64 平台均能复现，暂未定位到具体原因，进行了如下调整：
    - default_page_size 128K -> 32K

- EVENT 资源泄露记录
    - 目前 FUSE FORGET 流程还不完善，后续需要针对此项内容进行验证。
    - md-cache 泄露数量 1：mdc_inode_prep 中创建的资源需要在 FORGET 流程中通过 mdc_inode_wipe 释放。

ln -sf /sbin/glusterfsd /sbin/glusterfs
ln -sf /sbin/glusterfsd /sbin/glusterd
ln -sf /lib/glusterfs/xlator/cluster/afr.so /lib/glusterfs/xlator/cluster/replicate.so
ln -sf /lib/glusterfs/xlator/cluster/ec.so /lib/glusterfs/xlator/cluster/disperse.so
ln -sf /lib/glusterfs/xlator/cluster/dht.so /lib/glusterfs/xlator/cluster/distribute.so
ln -sf /lib/glusterfs/xlator/system/posix-acl.so /lib/glusterfs/xlator/features/access-control.so

PATH=$PATH:/sbin
varsave
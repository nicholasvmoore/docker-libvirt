#!/bin/bash
docker rm -f libvirtd
docker run --name libvirt --privileged --net=host -ti -d -e 'container=docker' \
-v /proc/modules:/proc/modules -v /mnt/usb0/libvirt/:/var/lib/libvirt/ \
-v /sys/fs/cgroup:/sys/fs/cgroup:rw libvirtd

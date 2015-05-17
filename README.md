libvirt within docker
---------------------

Commands
--------
Add an image
```bash
docker run -it --rm -v /mnt/usb0/libvirt:/var/lib/libvirt \
--net host libvirt-client curl -o /var/lib/libvirt/images/fedora.qcow2 \
http://fedora.osuosl.org/linux/releases/20/Images/x86_64/Fedora-x86_64-20-20131211.1-sda.qcow2
```

Run an image
```bash
docker run -it --rm -v /mnt/usb0/libvirt:/var/lib/libvirt \
libvirt-client virt-install --name fedora_test --ram 4096 --vcpus 2 \
--disk path=/var/lib/libvirt/images/fedora.qcow2,format=qcow2,bus=virtio,size=15 \
--network bridge=br0 --import
```

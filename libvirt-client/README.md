Common Functions
----------------

Change CD
---------
```bash
./test.sh virsh change-media pdxadmin hda /stuff.iso
```

Windows 2012
------------
```bash
virt-install \
   --name=pdxadmin \
   --os-type=windows \
   --vcpus=2 \
   --network network=host-bridge,type=virtio \
   --disk path=/var/lib/libvirt/images/pdxadmin.qcow2,size=40,format=qcow2,bus=virtio \
   --cdrom=/mnt/lun0/software/microsoft/win_server_2012_x64_dvd.iso \
   --graphics vnc,port=5900,listen=0.0.0.0,password=Welcome! \
   --ram=4096
```

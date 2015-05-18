#!/bin/bash
docker run -it --rm -v /mnt/usb0:/mnt/usb0 libvirt-client "$@"

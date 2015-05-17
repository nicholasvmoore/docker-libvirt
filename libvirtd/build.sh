#!/bin/bash
docker rm -f libvirtd
docker rmi libvirtd
docker build -t libvirtd .

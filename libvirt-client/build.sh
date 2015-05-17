#!/bin/bash
docker rm -f libvirt-client
docker rmi libvirt-client
docker build -t libvirt-client .

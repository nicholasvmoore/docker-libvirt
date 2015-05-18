FROM centos:7
MAINTAINER "Nicholas Moore" <nicholasvmoore@gmail.com>
ENV container docker

VOLUME [ "/var/lib/libvirt/" ]
CMD ["/usr/sbin/init"]

RUN yum -y update ; \
    rpm -e --nodeps fakesystemd & yum -y install systemd; \
    yum -y install pygobject3 virt-viewer virt-install libvirt-client && yum clean all; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*; \
    yum clean all

RUN echo 'uri_default = "qemu+tcp://172.17.42.1/system"' >> /etc/libvirt/libvirt.conf

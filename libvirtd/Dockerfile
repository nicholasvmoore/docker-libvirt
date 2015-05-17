FROM centos:7
MAINTAINER Nicholas Moore <nicholasvmoore@gmail.com>
ENV container docker

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

EXPOSE 16509

RUN yum -y update; \
    rpm -e --nodeps fakesystemd; \
    yum -y install systemd; \
    yum -y install libvirt-daemon-driver-* libvirt-daemon libvirt-daemon-kvm qemu-kvm && yum clean all; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*; \
    systemctl enable libvirtd; \
    systemctl enable virtlockd; \
    yum clean all
    
RUN echo "listen_tls = 0" >> /etc/libvirt/libvirtd.conf; \
    echo 'listen_tcp = 1' >> /etc/libvirt/libvirtd.conf; \
    echo 'tls_port = "16514"' >> /etc/libvirt/libvirtd.conf; \ 
    echo 'tcp_port = "16509"' >> /etc/libvirt/libvirtd.conf; \
    echo 'auth_tcp = "none"' >> /etc/libvirt/libvirtd.conf; \
    echo 'LIBVIRTD_ARGS="--listen"' >> /etc/sysconfig/libvirtd; \
    mkdir -p /var/lib/libvirt/images/; \
    sed -i "/Service/a ExecStartPost=\/bin\/chmod 666 /dev/kvm" /usr/lib/systemd/system/libvirtd.service

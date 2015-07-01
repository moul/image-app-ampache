## -*- docker-image-name: "armbuild/scw-app-ampache:latest" -*-
FROM armbuild/scw-distrib-ubuntu:vivid
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update \
 && apt-get -y -q upgrade \
 && apt-get install -y -q \
    ampache \
    ampache-themes \
    mysql-server


RUN systemctl enable mysql


# Use a dedicated vhost instead of a conf
RUN a2disconf ampache


# Patches
ADD patches/etc/ /etc/
ADD patches/usr/ /usr/
ADD patches/root/ /root/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
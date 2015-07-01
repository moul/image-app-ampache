## -*- docker-image-name: "armbuild/scw-app-openproject:latest" -*-
FROM armbuild/scw-distrib-ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update \
 && apt-get -y -q upgrade \
 && apt-get install -y -q ampache ampache-themes


# Use a dedicated vhost instead of a conf
RUN a2disconf ampache


# Patches
ADD patches/etc/ /etc/
ADD patches/usr/ /usr/
ADD patches/root/ /root/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
## -*- docker-image-name: "armbuild/scw-app-openproject:latest" -*-
FROM armbuild/scw-distrib-ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update \
 && apt-get -y -q upgrade \


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
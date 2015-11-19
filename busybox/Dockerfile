# mxabierto BusyBox
# Minimal busybox image
# rootfs: https://github.com/jpetazzo/docker-busybox/tree/buildroot-2014.02
#
# Build:
#   docker build -t mxabierto/busybox:2014.02 .
# Usage:
#   docker run --rm -it mxabierto/busybox:2014.02

# This is a scratch image
FROM scratch

MAINTAINER bcessa <ben@pixative.com>

ADD rootfs.tar.gz /

# Common files
ADD root /root

# Enviroment variables
ENV HOME=/root

# Working directory
WORKDIR /

# Start login shell
CMD ["/bin/ash","-l"]

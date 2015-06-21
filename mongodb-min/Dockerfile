# mxabierto MongoDB ( minimal )
# Minimal mongodb installation with SSL support
# Build:
#   docker build -t mxabierto/mongodb-min .
# Usage:
#   docker run --rm -it -P mxabierto/mongodb-min

# busybox base image
FROM busybox:ubuntu-14.04

MAINTAINER bcessa <ben@pixative.com>

# Set volume entry for data storage
RUN mkdir -p /data/db
VOLUME /data/db

# Copy dependencies
COPY files/libnuma.so /lib/libnuma.so
COPY files/libnuma.so.1 /lib/libnuma.so.1
COPY files/numactl /bin/numactl

# Add precompiled mongo binary
ADD https://s3.amazonaws.com/org.mxabierto/mongodb/3.0.3/mongod /bin/mongod
RUN chmod 775 /bin/mongod

# Export connection port
EXPOSE 27017

# Start command
CMD ["numactl", "--interleave=all", "mongod"]
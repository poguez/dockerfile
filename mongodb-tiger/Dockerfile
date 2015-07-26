# mxabierto MongoDB WiredTiger
# Minimal mongodb installation using WiredTiger as an optimized storage engine
# Build:
#   docker build -t mxabierto/mongodb-tiger .
# Usage:
#   docker run --rm -it -P mxabierto/mongodb-tiger

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
ENTRYPOINT ["numactl", "--interleave=all", "mongod", "--storageEngine=wiredTiger"]

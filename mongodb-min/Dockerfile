# mxabierto MongoDB ( minimal )
# Minimal mongodb installation with SSL support
# Options: --release --64 --ssl --static --wiredtiger=on --rocksdb
#
# Build:
#   docker build -t mxabierto/mongodb-min .
# Usage:
#   docker run --rm -it -P mxabierto/mongodb-min
#   docker run --rm -it -P mxabierto/mongodb-min --storageEngine=wiredTiger

# busybox base image
FROM busybox:1.24.1

MAINTAINER bcessa <ben@pixative.com>

# Add precompiled mongo binary
ADD https://s3.amazonaws.com/org.mxabierto/mongodb/3.0.7/mongod /bin/mongod
RUN chmod 775 /bin/mongod

# Export connection port
EXPOSE 27017

# Create new user account
RUN \
  mkdir -p /data/db && \
  adduser -h /data/db -D mongo && \
  chown -R mongo:mongo /data

# Data volume
VOLUME /data/db

# Start service with a set user account; not root
USER mongo

# Start command
ENTRYPOINT ["mongod"]

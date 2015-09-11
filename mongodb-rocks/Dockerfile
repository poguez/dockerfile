# mxabierto MongoDB + RocksDB
# http://blog.parse.com/announcements/mongodb-rocksdb-parse/
# Build:
#   docker build -t mxabierto/mongodb-rocks .
# Usage:
#   docker run --rm -itP mxabierto/mongodb-rocks

# Base image
FROM mxabierto/jessie

MAINTAINER bcessa <ben@pixative.com>

# Add precompiled mongo binary
ADD https://s3.amazonaws.com/org.mxabierto/mongodb/3.0.5/rocks/mongod  /bin/mongod
RUN chmod 775 /bin/mongod

# Export connection port
EXPOSE 27017

# Create new user account
RUN \
  mkdir -p /data/db && \
  useradd --home-dir /data/db -s /bin/false mongo && \
  chown -R mongo:mongo /data

# Define mountable directories
VOLUME ["/data/db"]

# Working directory
WORKDIR /data

# Start service with a set user account; not root
USER mongo

# Start command
ENTRYPOINT ["mongod", "--storageEngine=rocksdb"]

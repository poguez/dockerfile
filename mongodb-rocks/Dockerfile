# mxabierto MongoDB + RocksDB
# http://blog.parse.com/announcements/mongodb-rocksdb-parse/
# Build:
#   docker build -t mxabierto/mongodb-rocks .
# Usage:
#   docker run --rm -it -P mxabierto/mongodb-rocks

# Base image
FROM mxabierto/jessie

MAINTAINER bcessa <ben@pixative.com>

# Set volume entry for data storage
RUN mkdir -p /data/db
VOLUME /data/db

# Add precompiled mongo binary
ADD https://s3.amazonaws.com/org.mxabierto/mongodb/3.0.3/rocks/mongod  /bin/mongod
RUN chmod 775 /bin/mongod

# Export connection port
EXPOSE 27017

# Start command
CMD ["mongod", "--storageEngine=rocksdb"]
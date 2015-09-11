# mxabierto MongoDB
# Base mongodb installation using the official 10gen pakcages
# Build:
#   docker build -t mxabierto/mongodb .
# Usage:
#   docker run --rm -itP mxabierto/mongodb

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org=2.6.7 && \
  rm -rf /var/lib/apt/lists/*

# Create new user account
RUN \
  mkdir -p /data/db && \
  useradd --home-dir /data/db -s /bin/false mongo && \
  chown -R mongo:mongo /data

# Define mountable directories
VOLUME ["/data/db"]

# Working directory
WORKDIR /data

# Expose ports
#   27017: process
#   28017: http
EXPOSE 27017
EXPOSE 28017

# Start service with a set user account; not root
USER mongo

# Run server by default
ENTRYPOINT ["mongod"]

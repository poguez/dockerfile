# mxabierto MongoDB
# Base mongodb installation
# Build:
#   docker build -t mxabierto/mongodb .
# Usage:
#   docker run --rm -it -p 27017:27017 mxabierto/mongodb

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
  
# Define mountable directories
VOLUME ["/data/db"]

# Working directory
WORKDIR /data

# Run server by default
CMD ["mongod"]

# Expose ports
#   27017: process
#   28017: http
EXPOSE 27017
EXPOSE 28017
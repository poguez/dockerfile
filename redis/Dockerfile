# mxabierto Redis
# Base redis server installation
# Build:
#   docker build -t mxabierto/redis .
# Usage:
#   docker run --rm -it mxabierto/redis

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  apt-get update && \
  apt-get install -y tcl && \
  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable* && \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories
VOLUME ["/data"]

# Working directory
WORKDIR /data

# Run server with provided config by default
CMD ["redis-server", "/etc/redis/redis.conf"]

# Expose server port
EXPOSE 6379
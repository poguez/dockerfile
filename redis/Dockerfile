# mxabierto Redis
# Base redis server installation
# Build:
#   docker build -t mxabierto/redis .
# Usage:
#   docker run --rm -itP mxabierto/redis
# Custom redis.conf and sentinel.conf files:
#   docker run --rm -itP -v /my/conf:/etc/redis mxabierto/redis
# Using additional parameters:
#   docker run --rm -itP mxabierto/redis \
#   --maxmemory 256mb \
#   --maxmemory-policy allkeys-lru \
#   --maxmemory-samples 7

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  # Dependencies
  apt-get update && \
  apt-get install -y \
    build-essential \
    tcl \
    wget && \
  # Install stable redis from source
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
  # Clean up
  apt-get purge -y \
    build-essential \
    wget && \
  apt-get clean && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories
VOLUME ["/data"]

# Working directory
WORKDIR /data

# Expose server port
EXPOSE 6379

# Run server with provided config by default
CMD ["/etc/redis/redis.conf"]
ENTRYPOINT ["redis-server"]

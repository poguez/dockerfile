# mxabierto nodejs
# Base nodejs installation
# Build:
#   docker build -t mxabierto/nodejs .
# Usage:
#   docker run --rm -it mxabierto/nodejs

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  curl -sL https://deb.nodesource.com/setup | bash - && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/*

# Default command
CMD ["bash"]

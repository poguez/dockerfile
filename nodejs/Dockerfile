# Pixative nodejs
# Base nodejs installation
# Build:
#   docker build -t pixative:nodejs .
# Usage:
#   docker run --rm -it pixative:nodejs

# Base image
FROM pixative:base

# Extra packages
RUN \
  curl -sL https://deb.nodesource.com/setup | bash - && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/*

# Enviroment variables
ENV HOME /root

# Working directory
WORKDIR /root

# Default command
CMD ["bash"]

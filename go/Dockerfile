# Pixative Go
# Base Go installation
# Build:
#   docker build -t pixative:go .
# Usage:
#   docker run --rm -it pixative:go

# Base image
FROM pixative:base

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  curl -O https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go1.4.2.linux-amd64.tar.gz && \
  rm go1.4.2.linux-amd64.tar.gz && \
  echo "# GO SETTINGS" >> /root/.bashrc && \
  echo "export PATH=$PATH:/usr/local/go/bin" >> /root/.bashrc && \
  echo "export GOPATH=/root/go_workspace" >> /root/.bashrc && \
  rm -rf /var/lib/apt/lists/*
  
# Define mountable workspace directory
VOLUME ["/root/go_workspace"]

# Default command
CMD ["bash"]

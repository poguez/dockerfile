# mxabierto Go
# Base Go installation
# Build:
#   docker build -t mxabierto/go .
# Usage:
#   docker run --rm -it mxabierto/go

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Add binary package
ADD https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz /root/go.tgz

# Extra packages
RUN \
  tar -C /usr/local -xzf go.tgz && \
  rm go.tgz

# Add settings file
ADD settings /root/.dotfiles/go

# Define mountable workspace directory
VOLUME ["/root/go_workspace"]

# Default command
ENTRYPOINT ["/usr/local/go/bin/go"]

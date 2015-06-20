# mxabierto Python
# Base python installation
# Build:
#   docker build -t mxabierto/python .
# Usage:
#   docker run --rm -it mxabierto/python

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Install base python
RUN \
  apt-get update && \
  apt-get install -y \
  python-dev \
  python-pip && \
  rm -rf /var/lib/apt/lists/*

# Default command
CMD ["python"]

# mxabierto Python
# Base python installation
# Build:
#   docker build -t mxabierto/python .
# Usage:
#   docker run --rm -it mxabierto/python

# Base image
FROM mxabierto/alpine

MAINTAINER bcessa <ben@pixative.com>

# Install base python
RUN \
  apk-install \
  python \
  py-pip

# Default command
CMD ["python"]

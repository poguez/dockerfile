# mxabierto nodejs
# Base nodejs installation
# Build:
#   docker build -t mxabierto/nodejs .
# Usage:
#   docker run --rm -it mxabierto/nodejs

# Base image
FROM mxabierto/alpine

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  apk-install nodejs

# Default command
CMD ["node"]

# mxabierto Ruby
# Minimal base ruby installation
# Build:
#   docker build -t mxabierto/ruby .
# Usage:
#   docker run --rm -it mxabierto/ruby

# Base image
FROM mxabierto/alpine

MAINTAINER bcessa <ben@pixative.com>

# Install ruby
RUN \
  apk-install ruby-dev

# Default command
CMD ["ruby"]

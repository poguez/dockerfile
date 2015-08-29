# mxabierto Tor
# Base image to have a disposable Tor setup
#
# Build:
#   docker build -t mxabierto/tor .
# Usage:
#   docker run --rm -P -v /etc/localtime:/etc/localtime mxabierto/tor

# Base image
FROM mxabierto/alpine

MAINTAINER bcessa <ben@pixative.com>

# Install tor and cleanup
RUN \
  apk update && \
  apk add --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --update-cache tor && \
  rm -rf /var/cache/apk/*

# Incoming Tor connections
EXPOSE 9001

# Adjust config files permissions
RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]

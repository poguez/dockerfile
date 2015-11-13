# mxabierto Varnish
# Varnish - HTTP accelerator
# https://www.varnish-cache.org/docs
#
# Build:
#   docker build -t mxabierto/varnish .
# Usage:
#   docker run \
#   -dP --link CONTAINER_ID:backend \
#   mxabierto/varnish

FROM mxabierto/alpine

MAINTAINER bcessa <ben@pixative.com>

ENV \
  CACHE_SIZE=128m

ADD start.sh /start.sh

RUN \
  apk-install varnish && \
  chmod 775 /start.sh

# Cache http port and telnet interface
EXPOSE 6081

# Run as varnish user
USER varnish

# Run as binary
ENTRYPOINT [ "/start.sh" ]

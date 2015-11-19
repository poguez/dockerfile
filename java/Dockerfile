# mxabierto java
# Base Java installation
# Build:
#   docker build -t mxabierto/java .
# Usage:
#   docker run --rm -it mxabierto/java

# Base image
FROM mxabierto/alpine

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  apk-install openjdk7-jre-base

# Run as binary
ENTRYPOINT ["java"]

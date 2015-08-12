# mxabierto haveged
# Provide stronger entropy generation if required ( coreOS )
# Build:
#   docker build -t mxabierto/haveged .
# Usage:
#   docker run -d --privileged mxabierto/haveged

# Base image
FROM busybox:ubuntu-14.04

MAINTAINER bcessa <ben@pixative.com>

# Add statically linked binary
COPY ./haveged /haveged

# Enviroment variables
ENV \
  ENTROPY_LEVEL=1024

# Run as an executable
ENTRYPOINT ["/haveged"]

# Default parameters
CMD ["-w", "$ENTROPY_LEVEL", "-F", "1", "-v", "1"]

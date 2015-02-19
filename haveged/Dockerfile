# Pixative haveged
# Provide stronger entropy generation if required ( coreOS )
# Build:
#   docker build -t pixative:haveged .
# Usage:
#   docker run -d --privileged pixative:haveged

# Base image
FROM pixative:base

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  apt-get update && apt-get install -y haveged && \
  rm -rf /var/lib/apt/lists/*
  
# Enviroment variables
ENV \
  ENTROPY_LEVEL=1024

# Default command
ENTRYPOINT ["haveged", "-w", "$ENTROPY_LEVEL", "-F", "1", "-v", "1"]

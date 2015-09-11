# mxabierto MongoDB client
# Minimal mongodb client with SSL support
# Build:
#   docker build -t mxabierto/mongodb-client .
# Usage:
#   docker run --rm -it mxabierto/mongodb-client

# busybox base image
FROM busybox

MAINTAINER bcessa <ben@pixative.com>

# Add precompiled mongo binary
ADD https://s3.amazonaws.com/org.mxabierto/mongodb/3.0.3/mongo /bin/mongo
RUN chmod 775 /bin/mongo

# Start command
ENTRYPOINT ["mongo"]

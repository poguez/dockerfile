# mxabierto MongoDB Client
# Minimal mongodb client installation with SSL support
#
# Build:
#   docker build -t mxabierto/mongodb-client .
# Usage:
#   docker run --rm -it mxabierto/mongodb-client

# busybox base image
FROM busybox:1.24.1

MAINTAINER bcessa <ben@pixative.com>

# Add precompiled mongo binary
ADD https://s3.amazonaws.com/org.mxabierto/mongodb/3.0.7/mongo /bin/mongo
RUN chmod 775 /bin/mongo

# Run shell client as default command
ENTRYPOINT ["mongo"]

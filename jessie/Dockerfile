# mxabierto base jessie image
# Base OS installation with common packages and files
# Build:
#   docker build -t mxabierto/jessie .
# Usage:
#   docker run --rm -it mxabierto/jessie

# Base image
FROM debian:jessie

MAINTAINER bcessa <ben@pixative.com>

# Add gosu
ADD https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 /bin/gosu
RUN chmod +x /bin/gosu

# Common files
ADD root /root

# Enviroment variables
ENV HOME=/root

# Working directory
WORKDIR /root

# Default command
CMD ["/bin/bash"]

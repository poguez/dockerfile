# mxabierto
# Go builder image
#
# Usage:
#   Used internally by the Makefile; to use it in a project simply add
#   both files and run 'make'
FROM golang

MAINTAINER bcessa <ben@pixative.com>

# Add package contents
ADD . /

# Set main working area
WORKDIR /

# Build static binary
RUN make buildgo

CMD ["/bin/true"]

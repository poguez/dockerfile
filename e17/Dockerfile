# mxabierto e17
# Base OS installation with enlightenment 0.17 as desktop shell
# Build:
#   docker build -t mxabierto/e17 .
# Usage:
#   docker run --rm -it -p 5901:5901 mxabierto/e17 \
#   bash -c "vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log"


# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Add installer script
ADD install.sh /root/install.sh

# Update packages list and run installer
RUN \
  apt-get update && \
  ./root/install.sh

# Install VNC server
RUN \
  apt-get install -y tightvncserver && \
  rm -rf /var/lib/apt/lists/*

# Default command
CMD ["bash"]

# Expose VNC port
EXPOSE 5901

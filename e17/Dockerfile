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

# Install dependencies
RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    tightvncserver \
    wget

# e17 setup
RUN /root/install.sh

# Clean up
RUN \
  apt-get purge -y \
    build-essential \
    wget && \
  apt-get clean && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

# Expose VNC port
EXPOSE 5901

# Default command
CMD ["bash"]

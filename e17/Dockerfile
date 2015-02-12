# Pixative e17
# Base OS installation with enlightenment 0.17 as desktop shell
# Build:
#   docker build -t pixative:e17 .
# Usage:
#   docker run --rm -it -p 5901:5901 pixative:e17 \
#   bash -c "vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log"


# Base image
FROM pixative:base

# Update base OS
RUN \
  apt-get update && \
  apt-get -y upgrade

# Add installer and run it
ADD install.sh /root/install.sh
RUN ./install.sh

# Install VNC server
RUN \
  apt-get install -y tightvncserver && \
  rm -rf /var/lib/apt/lists/*

# Enviroment variables
ENV HOME /root

# Working directory
WORKDIR /root

# Default command
CMD ["bash"]

# Expose VNC port
EXPOSE 5901

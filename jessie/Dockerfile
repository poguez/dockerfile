# Pixative base jessie image
# Base OS installation with common packages and files
# Build:
#   docker build -t pixative:jessie .
# Usage:
#   docker run --rm -it pixative:jessie

# Base image
FROM debian:jessie

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  apt-get update && \
  apt-get install -y \
    bash-completion \
    build-essential \
    curl \
    git \
    htop \
    rsync \
    screen \
    tree \
    unzip \
    wget \
    zip && \
  apt-get clean && apt-get autoclean && apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*

# Common files
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts
ADD root/.dotfiles /root/.dotfiles

# Enviroment variables
ENV \
  HOME=/root

# Working directory
WORKDIR /root

# Default command
CMD ["bash"]

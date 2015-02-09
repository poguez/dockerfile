# Pixative base image
# Base OS installation with common packages and files
# Build:
#   docker build -t pixative:base .
# Usage:
#   docker run --rm -it pixative:base

# Base image
FROM debian:wheezy

# Extra packages
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y screen curl git tree ncdu ntp ntpdate \
                     htop man zip unzip nano wget rsync \
                     bash-completion lsb-release && \
  apt-get clean && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*

# Enable time sync using NTP at start
RUN \
  service ntp stop && \
  ntpdate -s pool.ntp.org && \
  echo "service ntp start" >> /etc/bash.bashrc

# Common files
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Enviroment variables
ENV HOME /root

# Working directory
WORKDIR /root

# Default command
CMD ["bash"]

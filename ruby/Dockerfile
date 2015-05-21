# mxabierto Ruby
# Base Ruby installation using rbenv
# Build:
#   docker build -t mxabierto/ruby .
# Usage:
#   docker run --rm -it mxabierto/ruby

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Install dependencies
RUN \
  apt-get update && \
  apt-get install -y \
  libbz2-dev \
  libcurl4-openssl-dev \
  libevent-dev \
  libffi-dev \
  libglib2.0-dev \
  libjpeg-dev \
  liblzma-dev \
  libmagickcore-dev \
  libmagickwand-dev \
  libmysqlclient-dev \
  libncurses-dev \
  libpq-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxslt-dev \
  libyaml-dev \
  zlib1g-dev && \
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash && \
  rm -rf /var/lib/apt/lists/*
  
# Add settings file
ADD settings /root/.dotfiles/ruby

# Enviroment variables
ENV \
  RUBY_VERSION=2.1.2 \
  PATH=$HOME/.rbenv/bin:$PATH
  
# Install Ruby and set the working version as default
RUN \
  rbenv install $RUBY_VERSION -k && \
  rbenv global $RUBY_VERSION

# Default command
CMD ["bash"]

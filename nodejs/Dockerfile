# mxabierto nodejs
# Minimal nodejs LTS installation
# https://github.com/mhart/alpine-node
#
# Build:
#   docker build -t mxabierto/nodejs .
# Usage:
#   docker run --rm -it mxabierto/nodejs

# Base image
FROM mxabierto/alpine

MAINTAINER bcessa <ben@pixative.com>

ENV VERSION=4.2.2

# Extra packages
RUN \
  apk-install \
    curl \
    gcc \
    g++ \
    libgcc \
    libstdc++ \
    linux-headers \
    make \
    paxctl \
    python && \
  curl -sSL https://nodejs.org/dist/v${VERSION}/node-v${VERSION}.tar.gz | tar -xz && \
  cd /node-v${VERSION} && \
  ./configure --prefix=/usr --fully-static && \
  make -j2 && \
  make install && \
  paxctl -cm /usr/bin/node && \
  npm install -g npm@latest && \
  apk del \
    curl \
    gcc \
    g++ \
    libgcc \
    libstdc++ \
    linux-headers \
    make \
    paxctl \
    python && \
  rm -rf \
    /node-v${VERSION} \
    /usr/share/man \
    /tmp/* \
    /var/cache/apk/* \
    /root/.npm \
    /root/.node-gyp \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html

# Run as binary
ENTRYPOINT ["node"]

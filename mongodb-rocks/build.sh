#!/bin/bash
# Describes the procedure to compile the mongo binaries

# Deps
apt-get install \
  build-essential \
  git-core \
  lintian \
  libpcre3 \
  libpcre3-dev \
  libboost-dev \
  libboost-date-time-dev \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libboost-thread-dev \
  libpcap-dev \
  libreadline-dev \
  libssl-dev \
  libbz2-dev \
  libsnappy-dev \
  libzlcore-dev \
  rng-tools \
  scons \
  zlib1g-dev

# RocksDB
git clone https://github.com/facebook/rocksdb.git
cd rocksdb
git checkout v4.0
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) static_lib
make install
cd ..

# Mongo
mkdir /var/tmp/rocks-build
git clone https://github.com/mongodb-partners/mongo.git
cd mongo
git checkout v3.0.7-mongorocks
scons mongod mongo mongos --64 --ssl --release -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) --prefix=/var/tmp/rocks-build --rocksdb=1 install
cd ..

# Pack
tar -cvzf ~/mongo-rocks.tgz /var/tmp/rocks-build/bin/*

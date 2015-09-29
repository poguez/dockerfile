# mxabierto Solr
# Solr is a popular, blazing-fast, open source enterprise search platform
# Build:
#   docker build -t mxabierto/solr .
# Usage:
#   docker run --rm -it -p 8983:8983 mxabierto/solr

FROM debian:jessie

MAINTAINER bcessa <ben@pixative.com>

# Environment params
ENV SOLR_VERSION 5.3.1

# Install dependencies
RUN \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/java.list && \
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  apt-get update && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y \
    lsof \
    oracle-java8-installer \
    oracle-java8-set-default && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*

# Install solr
RUN \
  wget http://apache.arvixe.com/lucene/solr/${SOLR_VERSION}/solr-${SOLR_VERSION}.tgz -O solr.tgz && \
  tar -xvzf solr.tgz && \
  mv solr-${SOLR_VERSION} solr && \
  rm solr.tgz

# Default workdir
WORKDIR "/solr/"

# Default Solr port
EXPOSE 8983

# Start server in foreground by default
CMD ["start", "-f"]

# Use binary as default entry point
ENTRYPOINT ["/solr/bin/solr"]

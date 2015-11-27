# Apache Drill
# Schema-free SQL Query Engine for Hadoop, NoSQL and Cloud Storage
# Build:
#   docker build -t mxabierto/drill .
# Usage:
#   docker run -itP --rm mxabierto/drill
#   docker run -dP mxabierto/drill

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

ENV \
  DRILL_VERSION=1.3.0 \
  DRILL_MAX_MEMORY=2G \
  DRILL_HEAP=1G

# Install on '/'
WORKDIR /

RUN \
  # Dependencies
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/java.list && \
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  apt-get update && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y \
    oracle-java7-installer \
    oracle-java7-set-default \
    watch \
    zookeeper \
    zookeeperd && \
  # Apache Drill
  wget http://getdrill.org/drill/download/apache-drill-${DRILL_VERSION}.tar.gz && \
  tar -xvzf apache-drill-${DRILL_VERSION}.tar.gz && \
  rm apache-drill-${DRILL_VERSION}.tar.gz && \
  rm -rf apache-drill-${DRILL_VERSION}/sample-data && \
  rm -rf apache-drill-${DRILL_VERSION}/winutils && \
  mv apache-drill-${DRILL_VERSION} apache-drill && \
  # Clean up
  apt-get clean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*

# Add start script
ADD start.sh /start.sh

# Ports
# - Drill HTTP
# - Drill ODBC
EXPOSE 8047 31010

CMD ["/start.sh"]

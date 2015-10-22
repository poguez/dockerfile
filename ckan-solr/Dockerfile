# mxabierto CKAN-Solr
# Solr installation for CKAN usage
# Build:
#   docker build -t mxabierto/ckan-solr .
# Usage:
#   docker run --rm -it -p 8983:8983 mxabierto/ckan-solr

# Base image
FROM ubuntu:10.04

MAINTAINER bcessa <ben@pixative.com>

USER root

# Install dependencies
RUN \
  DEBIAN_FRONTEND=noninteractive \
  apt-get update && \
  apt-get install -y \
    solr-jetty \
    openjdk-6-jdk

# Add CKAN schema
ADD start.sh /start.sh
ADD https://raw.githubusercontent.com/ckan/ckan/master/ckan/config/solr/schema.xml /etc/solr/conf/schema.xml

# Adjust configuration file
RUN \
  chmod 644 /etc/solr/conf/schema.xml && \
  sed -i 's/NO_START=1/NO_START=0/' /etc/default/jetty && \
  sed -i 's/#JETTY_HOST=$(uname -n)/JETTY_HOST=0.0.0.0/' /etc/default/jetty && \
  sed -i 's/#JETTY_PORT=8080/JETTY_PORT=8983/' /etc/default/jetty

# Entrypoint
CMD ["/start.sh"]

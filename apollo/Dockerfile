# mxabierto Apollo
# ActiveMQ Apollo is a faster, more reliable, easier to maintain messaging
# broker built from the foundations of the original ActiveMQ.
# https://activemq.apache.org/apollo/
#
# Build:
#   docker build -t mxabierto/apollo .
# Usage:
#   docker run -dP mxabierto/apollo

# Base image
FROM mxabierto/java

MAINTAINER bcessa <ben@pixative.com>

# Working directory
WORKDIR /root

# Install apollo and create broker
RUN \
  wget http://apache.webxcreen.org/activemq/activemq-apollo/1.7.1/apache-apollo-1.7.1-unix-distro.tar.gz && \
  tar -xzf apache-apollo-1.7.1-unix-distro.tar.gz && \
  rm apache-apollo-1.7.1-unix-distro.tar.gz && \
  export PATH=$PATH:/root/apache-apollo-1.7.1/bin && \
  apollo create /var/lib/broker

# Export connection ports:
# - tcp
# - tls
# - ws
# - wss
EXPOSE 61613 61614 61623 61624

# Export administration interface:
# - http
# - https
EXPOSE 61680 61681

# Change working directory to the broker instance
WORKDIR /var/lib/broker

# Run the broker as entry point
ENTRYPOINT ["/var/lib/broker/bin/apollo-broker", "run"]

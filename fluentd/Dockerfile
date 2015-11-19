# mxabierto fluentd
# Unified logging layer component
# Build:
#   docker build -t mxabierto/fluentd .
# Usage:
#   docker run -d \
#   -v /var/lib/docker/containers:/var/lib/docker/containers \
#   mxabierto/fluentd

# Base image
FROM mxabierto/ruby

# http://docs.fluentd.org/articles/before-install
RUN ulimit -n 65536

# Install core and required plugins
RUN \
  apk-install \
    build-base \
    ca-certificates && \
  echo 'gem: --no-document' >> /etc/gemrc && \
  gem install fluentd -v 0.12.15 && \
  fluentd --setup /etc/fluent && \
  mkdir /var/run/fluentd && \
  fluent-gem install fluent-plugin-elasticsearch && \
  fluent-gem install fluent-plugin-record-reformer && \
  apk del build-base

# Expose interface
EXPOSE 24224

# Load default config file
CMD ["-c","/etc/fluent/fluent.conf"]

# Run as 'fluentd' executable
ENTRYPOINT ["fluentd"]

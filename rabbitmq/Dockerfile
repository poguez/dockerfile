# Pixative RabbitMQ
# Base rabbitmq installation
# Build:
#   docker build -t pixative:rabbitmq .
# Usage:
#   docker run --rm -it -p 15672:15672 pixative:rabbitmq

# Base image
FROM pixative:base

# Extra packages
RUN \
  curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add - && \
  echo 'deb http://www.rabbitmq.com/debian/ testing main' > /etc/apt/sources.list.d/rabbitmq.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y rabbitmq-server && \
  rm -rf /var/lib/apt/lists/*

# Start rabbitmq server with management plugin enabled
RUN \
  sed -i 's/#ulimit/ulimit/' /etc/default/rabbitmq-server && \
  rabbitmq-plugins enable rabbitmq_management && \
  echo "service rabbitmq-server start" >> /etc/bash.bashrc

# Provide a shell by default
CMD ["bash"]

# Expose ports
# 4369 (epmd)
# 25672 (Erlang distribution)
# 5672 (AMQP 0-9-1 without TLS)
# 5671 (AMQP 0-9-1 with TLS)
# 15672 (if management plugin is enabled)
# 61613, 61614 (if STOMP is enabled)
# 1883, 8883 (if MQTT is enabled)
EXPOSE 4369
EXPOSE 25672
EXPOSE 5672
EXPOSE 5671
EXPOSE 15672
EXPOSE 61613
EXPOSE 61614
EXPOSE 1883
EXPOSE 8883

# mxabierto Vault
# Vault server as a docker container
# Build:
#   docker build -t mxabierto/vault .
# Usage:
#   Start a server in the default dev mode
#   docker run --cap-add IPC_LOCK --rm -itP mxabierto/vault
#
#   Start a server with the default file-based backend
#   docker run --cap-add IPC_LOCK --rm -itP mxabierto/vault -config=/config/demo.hcl

# Base minimal/empty image
FROM busybox:ubuntu-14.04

MAINTAINER bcessa <ben@pixative.com>

# Environment params
ENV VAULT_VERSION 0.2.0

# Add pre-build binary
ADD config /config
ADD https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip /vault.zip
RUN \
  unzip /vault.zip && \
  chmod 775 /vault && \
  rm /vault.zip && \
  mv /vault /bin/vault

# Define mountable directory for configuration files
VOLUME ["/config"]

# Vault server port
EXPOSE 8200

# Run in development mode by default
CMD ["-dev"]

# Use binary as default entry point
ENTRYPOINT ["/bin/vault", "server"]

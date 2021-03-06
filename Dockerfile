FROM alpine:3.10

ENV VAULT_VERSION 1.5.4
LABEL name="vault"
LABEL version=1.5.4

# x509 expects certs to be in this file only.
RUN apk --update --no-cache add ca-certificates openssl && \
  wget -qO /tmp/vault.zip "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" && \
  unzip -d /bin /tmp/vault.zip && \
  chmod 755 /bin/vault && \
  rm /tmp/vault.zip

EXPOSE 8200
VOLUME "/config"

ENTRYPOINT ["/bin/vault"]

CMD ["server", "-dev-listen-address=0.0.0.0:8200"]
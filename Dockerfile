FROM alpine:3.5

RUN apk --no-cache add bash curl jq wget groff less python py-pip &&\
  pip install awscli &&\
  apk --purge -v del py-pip

### use docker-1.6.2; upgrading will break password decryption
RUN (wget "https://get.docker.com/builds/Linux/x86_64/docker-1.6.2" -O /usr/bin/docker &&\
  chmod +x /usr/bin/docker)
COPY migrator.sh /usr/local/bin/migrator.sh

CMD ["/usr/local/bin/migrator.sh"]

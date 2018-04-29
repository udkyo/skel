FROM alpine

LABEL MAINTAINER "discohammock@udk.io"

RUN apk add --no-cache shadow

COPY skeleton/ /skeleton/
COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
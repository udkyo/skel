FROM busybox

LABEL MAINTAINER "discohammock@udk.io"

COPY skeleton/ /skeleton/
COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
FROM __IMAGE__

RUN wget >/dev/null 2>&1 || \
    apk add --no-cache wget 2>/dev/null || \
    yum install -y wget 2>/dev/null || \
    (apt update && apt install -y wget) 2>/dev/null || \
    pacman -Syu wget --noconfirm 2>/dev/null

RUN wget -qO /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 \
    && chmod +x /usr/local/bin/dumb-init

# Do your thing here

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["dumb-init", "--"]
CMD ["/entrypoint.sh"]
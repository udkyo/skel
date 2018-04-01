FROM __IMAGE__

# Add more packages inside quotes - e.g. packages="wget git unzip"
ENV PACKAGES="wget"

RUN apk add --no-cache $PACKAGES 2>/dev/null || \
    yum install -y $PACKAGES 2>/dev/null || \
    (apt update && apt install -y $PACKAGES) 2>/dev/null || \
    pacman -Syu $PACKAGES --noconfirm 2>/dev/null

RUN wget -qO /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 \
    && chmod +x /usr/local/bin/dumb-init

# Do your thing here

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["dumb-init", "--"]
CMD ["/entrypoint.sh"]
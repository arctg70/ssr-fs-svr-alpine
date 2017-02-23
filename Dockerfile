FROM anapsix/alpine-java:7_jdk

RUN apk update \
    && apk add python libsodium unzip wget \
    && rm -rf /var/cache/apk/* \
    && mkdir /ssr \
    && cd /ssr \
    && wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /tmp/manyuser.zip \
    && unzip -d /tmp /tmp/manyuser.zip \
    && mv /tmp/shadowsocksr-manyuser/shadowsocks /ssr/shadowsocks \
    && rm -rf /tmp/* \
    && apk add --no-cache --virtual .build-deps curl \
    && curl -sSL https://raw.githubusercontent.com/jonechenug/finalspeed/master/install_fs.sh --output install_fs.sh \
    && chmod +x install_fs.sh \
    && ./install_fs.sh 2>&1 | tee install.log \
    && apk del .build-deps wget curl unzip

COPY config.json /config.json
COPY dns.conf /ssr/shadowsocks/dns.conf

EXPOSE 150/udp
EXPOSE 8765
EXPOSE 8766

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["sh", "-c", "/start.sh"]

#FROM alpine:edge
FROM anapsix/alpine-java

RUN apk update \
    && apk add python libsodium unzip wget \
    && rm -rf /var/cache/apk/*

RUN mkdir /ssr \
    && cd /ssr \
    && wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /tmp/manyuser.zip \
    && unzip -d /tmp /tmp/manyuser.zip \
    && mv /tmp/shadowsocksr-manyuser/shadowsocks /ssr/shadowsocks \
    && rm -rf /tmp/*
RUN curl -sSL https://raw.githubusercontent.com/jonechenug/finalspeed/master/install_fs.sh --output install_fs.sh \
    && chmod +x install_fs.sh \
    && ./install_fs.sh 2>&1 | tee install.log

COPY config.json /config.json
COPY dns.conf /ssr/shadowsocks/dns.conf
COPY r.sh /ssr/shadowsocks/r.sh
RUN chmod +x /ssr/shadowsocks/r.sh

EXPOSE 150/udp
EXPOSE 8388

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["sh", "-c", "/start.sh"]
#WORKDIR /ssr/shadowsocks

#CMD /ssr/shadowsocks/r.sh

FROM lsiobase/alpine:3.8

LABEL maintainer="Nodecloud"

ENV TZ='Asia/Shanghai'
ENV SMARTDNS_RELEASE_LINK='https://github.com/pymumu/smartdns/releases/download/Release31/smartdns.1.2020.05.04-0005.x86_64-linux-all.tar.gz'

RUN \
    apk add --no-cache openssl libc6-compat curl && \
    cd /tmp && \
    curl -fSL ${SMARTDNS_RELEASE_LINK} -o smartdns.tar.gz && \
    tar zxf smartdns.tar.gz && \
    cp /tmp/smartdns/usr/sbin/smartdns /usr/bin/ && \
    rm -rf /tmp/smartdns

COPY rootfs/ /

EXPOSE 53:53/udp
VOLUME /config

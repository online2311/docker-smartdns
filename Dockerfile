FROM lsiobase/alpine:3.8

# Mostly copied from https://github.com/Leoyzen/docker-smartdns
LABEL maintainer="RobinVP"

ENV TZ='Asia/Shanghai'
ENV SMARTDNS_RELEASE_LINK='https://github.com/pymumu/smartdns/releases/download/Release24/smartdns.1.2019.04.25-2140.x86_64.tar.gz'

RUN \
    apk add --no-cache openssl libc6-compat curl && \
    cd /tmp && \
    curl -fSL ${SMARTDNS_RELEASE_LINK} -o smartdns.tar.gz && \
    tar zxf smartdns.tar.gz && \
    cp /tmp/smartdns/src/smartdns /usr/bin/ && \
    rm -rf /tmp/smartdns

COPY rootfs/ /

EXPOSE 53:53/udp
VOLUME /config
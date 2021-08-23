FROM alpine:3.12

RUN apk update && apk upgrade \
    && apk --no-cache add wget \
    && wget http://dl-cdn.alpinelinux.org/alpine/edge/community/x86_64/telegraf-1.18.2-r0.apk \
    && apk --no-cache add telegraf-1.18.2-r0.apk \
    && mkdir -p /etc/telegraf \
    && rm -rf telegraf-1.18.2-r0.apk
COPY telegraf.conf /etc/telegraf

ENTRYPOINT telegraf --config /etc/telegraf/telegraf.conf

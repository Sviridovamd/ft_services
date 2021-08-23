FROM alpine:3.12

RUN apk update && apk upgrade \
	&& apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community/ grafana \
	&& rm -rf /var/cache/apk/*
	

COPY /dashboards/* /usr/share/grafana/conf/dashboards/
COPY dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY datasources.yaml /usr/share/grafana/conf/provisioning/datasources/

EXPOSE 3000

ENTRYPOINT [ "grafana-server", "--homepath=/usr/share/grafana" ]

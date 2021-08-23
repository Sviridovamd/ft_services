FROM    alpine:3.12


RUN apk update && apk upgrade \
	&& apk add mysql mysql-client bash \
	&& rm -rf /var/cache/apk/*

COPY mysql.sh /tmp/
COPY wmadison_db.sql my.cnf ./


RUN mkdir -p /run/mysqld \
	&& mv my.cnf /etc/ \
    && chmod 644 /tmp

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["bash", "/tmp/mysql.sh"]
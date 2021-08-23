FROM alpine:3.12

RUN apk update && apk upgrade \
	&& apk add --no-cache vsftpd bash wget openssl

RUN mkdir -p /ftps/wmadison \
	&& adduser -h /ftps/wmadison -D wmadison \
	&& echo 'wmadison:wmadison' | chpasswd \
	&& chmod -R 777 /ftps \
	&& chown -R wmadison:wmadison /ftps

# SSL
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/vsftpd.pem -keyout /etc/ssl/certs/vsftpd.pem \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21-school/OU=wmadison/CN=wmadison"

COPY ./vsftpd.conf /etc/vsftpd/
COPY ./vsftpd.sh /tmp/
RUN chmod -R 644 /tmp

EXPOSE 20-21 21040-21044
ENTRYPOINT ["bash", "/tmp/vsftpd.sh"]
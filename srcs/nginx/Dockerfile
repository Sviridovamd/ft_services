FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add --no-cache nginx bash openssh openssl


RUN adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www

RUN mkdir -p var/run/nginx


RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/


RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/wmadison.pem -keyout /etc/ssl/certs/wmadison.key \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21-school/OU=wmadison/CN=wmadison"


COPY index.html /www/



EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

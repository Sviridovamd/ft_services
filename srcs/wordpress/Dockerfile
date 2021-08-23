FROM    alpine:3.12
RUN     apk update && apk upgrade
RUN     apk add --no-cache nginx bash wget

# new nginx group 
RUN     adduser -D -g 'wmadison' wmadison \
	    && mkdir -p /www/wordpress \
	    && chown -R wmadison:wmadison /var/lib/nginx \
	    && chown -R wmadison:wmadison /www

RUN     mkdir -p var/run/nginx

# Config NGINX
RUN     mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY    ./nginx.conf /etc/nginx/

# PHP
RUN     apk add php7 php7-fpm php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

# WORDPRESS
RUN     wget http://wordpress.org/wordpress-5.6.tar.gz \
        && tar -C /www/wordpress/ -xzvf wordpress-5.6.tar.gz --strip-components 1\
        && rm -rf wordpress-5.6.tar.gz \
        && chown -R wmadison:wmadison /www/wordpress/ \
        && chmod -R 755 /www/wordpress/

COPY    wp-config.php /www/wordpress
COPY    wp.sh /tmp/wp.sh
RUN     chmod 644 /tmp/wp.sh

EXPOSE  5050
#start nginx, nginx in demon mod
ENTRYPOINT ["bash", "/tmp/wp.sh"]
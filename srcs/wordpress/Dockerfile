FROM    alpine:3.12

RUN     apk update 
RUN     apk add --no-cache supervisor
RUN     apk add wget nginx && apk add openssl \
	    && apk add php7-fpm

#       Wordpress
RUN     mkdir -p /var/www/localhost
COPY    wordpress /var/www/localhost/wordpress
RUN     chown -R nginx:nginx /var/www/localhost/wordpress

RUN     mkdir -p /etc/nginx/ssl/ && mkdir /run/nginx
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19 School/OU=Bourdanne/CN=localhost"
COPY    nginx.conf /etc/nginx/conf.d/localhost.conf
RUN     rm /etc/nginx/conf.d/default.conf 

#       Supervisor
RUN     mkdir -p /var/log/supervisor
COPY    ./supervisord.conf /etc/

EXPOSE  5050

COPY    setup.sh /tmp

CMD     sh /tmp/setup.sh
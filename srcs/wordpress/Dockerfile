FROM    alpine:3.12

RUN     apk update 
RUN     apk add --no-cache supervisor
RUN     apk add wget nginx \
	    && apk add php7 php7-opcache php7-gd php7-zlib php7-fpm php7-common php7-session php7-iconv php7-curl php7-mbstring php7-json php7-xml php7-mysqli

#       Wordpress
RUN     mkdir -p /var/www/localhost
COPY    wordpress /var/www/localhost/wordpress
RUN     chown -R nginx:nginx /var/www/localhost/wordpress

RUN     mkdir /run/nginx
COPY    nginx.conf /etc/nginx/conf.d/localhost.conf
RUN     rm /etc/nginx/conf.d/default.conf

#       Telegraf
RUN		apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY	telegraf.conf /etc/telegraf.conf

EXPOSE  5050

COPY    setup.sh /tmp

CMD     sh /tmp/setup.sh
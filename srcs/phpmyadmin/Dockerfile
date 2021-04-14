FROM    alpine:3.12

RUN     apk update 
RUN		apk add php7 php7-opcache php7-gd php7-zlib php7-fpm php7-common php7-session php7-iconv php7-curl php7-mbstring php7-json php7-xml php7-mysqli

#		Phpmyadmin
COPY	phpmyadmin /var/www/phpmyadmin

#       Telegraf
RUN 	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY 	telegraf.conf /etc/telegraf.conf

EXPOSE  5000

COPY    setup.sh /tmp

CMD     sh /tmp/setup.sh
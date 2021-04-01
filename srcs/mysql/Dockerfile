FROM    alpine:3.12

RUN     apk update \
        && apk add --no-cache supervisor \
        && apk add --no-cache mysql mysql-client

RUN     mkdir -p /run/mysqld
COPY    my.cnf /etc/
COPY    setup.sh /tmp
COPY    wordpress.sql init_file /tmp/
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#       Supervisor
RUN     mkdir -p /var/log/supervisor
COPY    ./supervisord.conf /etc/

EXPOSE  3306

CMD     sh /tmp/setup.sh
FROM    alpine:3.12

RUN     apk update \
        && apk add --no-cache mysql mysql-client

RUN     mkdir -p /run/mysqld
RUN     mkdir -p /var/log/mysql/
COPY    my.cnf /etc/
COPY    setup.sh /tmp
COPY    wordpress.sql init_file /tmp/

#       Telegraf
RUN     apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY    telegraf.conf /etc/telegraf.conf

EXPOSE  3306

CMD     sh /tmp/setup.sh
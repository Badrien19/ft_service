FROM    alpine:3.12

RUN     apk update && apk add influxdb
RUN     apk add --no-cache supervisor
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN     mkdir -p /etc/telegraf
COPY    ./telegraf.conf /etc/telegraf/telegraf.conf
COPY    influxdb.sh /influxdb.sh
RUN     chmod +x /influxdb.sh

RUN     mkdir -p /var/log/supervisor
COPY    ./supervisord.conf /etc/

EXPOSE  8086

CMD     ./influxdb.sh
FROM    alpine:3.12

RUN apk update && apk add influxdb
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY influxdb.sh /influxdb.sh
RUN chmod +x /influxdb.sh

EXPOSE 8086

CMD ./start.sh
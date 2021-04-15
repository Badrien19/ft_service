FROM	alpine:3.12

COPY	setup.sh ./

# 		Install influxdb and dependencies
RUN 	apk update && \
		apk add --no-cache influxdb

# 		Install telegraf
RUN     apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY    telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 	8086

CMD 	./setup.sh

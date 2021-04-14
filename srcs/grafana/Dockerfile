FROM alpine:3.12

# User=admin ; Password=admin

COPY datasource.yaml dashboard.yaml dashboards setup.sh ./

# Install Grafana
RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Configure Grafana
RUN mv datasource.yaml /usr/share/grafana/conf/provisioning/datasources/ && \
	mv *.json dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/

# Install telegraf
RUN     apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY    telegraf.conf /etc/telegraf.conf

EXPOSE 3000

CMD ./setup.sh

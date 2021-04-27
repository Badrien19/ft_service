# Start telegraf
/usr/bin/telegraf --config /etc/telegraf.conf &

# Start Grafana
/usr/sbin/grafana-server --homepath=/usr/share/grafana

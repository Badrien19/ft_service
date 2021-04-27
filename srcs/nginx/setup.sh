telegraf --config /etc/telegraf.conf &
sleep 12
nginx -g "daemon off;"
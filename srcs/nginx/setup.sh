telegraf --config /etc/telegraf.conf &
sleep 10 #Laissez le temps à php de se lancer
nginx -g "daemon off;"
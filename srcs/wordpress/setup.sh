telegraf --config /etc/telegraf.conf &
nginx -g "daemon off;"
php-fpm7 --nodaemonize

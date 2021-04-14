#telegraf --config /etc/telegraf.conf &

# Setup
/usr/bin/mysql_install_db --datadir=/var/lib/mysql

# Start
/usr/bin/mysqld --user=root --init_file=/tmp/init_file & sleep 3

# Initialize DB
mysql wordpress -u root < tmp/wordpress.sql

tail -f /dev/null
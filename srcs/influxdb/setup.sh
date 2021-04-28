# Start telegraf
/usr/bin/telegraf --config /etc/telegraf.conf &

# Start influxdb
/usr/sbin/influxd & sleep 3

# Initialize database
influx -execute "CREATE DATABASE IF NOT EXIST FTPS"
influx -execute "CREATE USER IF NOT EXIST admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON FTPS TO admin"

influx -execute "CREATE DATABASE IF NOT EXIST Grafana"
influx -execute "CREATE USER IF NOT EXIST admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON Grafana TO admin"

influx -execute "CREATE DATABASE IF NOT EXIST InfluxDB"
influx -execute "CREATE USER IF NOT EXIST admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON InfluxDB TO admin"

influx -execute "CREATE DATABASE IF NOT EXIST mysql"
influx -execute "CREATE USER IF NOT EXIST admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON mysql TO admin"

influx -execute "CREATE DATABASE IF NOT EXIST nginx"
influx -execute "CREATE USER IF NOT EXIST admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON nginx TO admin"

influx -execute "CREATE DATABASE IF NOT EXIST phpmyadmin"
influx -execute "CREATE USER IF NOT EXIST admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON phpmyadmin TO admin"

influx -execute "CREATE DATABASE IF NOT EXIST Wordpress"
influx -execute "CREATE USER IF NOT EXIST admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON Wordpress TO admin"

# Keep container running
tail -f /dev/null

# Start telegraf
/usr/bin/telegraf &

# Start influxdb
/usr/sbin/influxd & sleep 3

# Initialize database
influx -execute "CREATE DATABASE FTPS"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON FTPS TO admin"

influx -execute "CREATE DATABASE Grafana"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON Grafana TO admin"

influx -execute "CREATE DATABASE InfluxDB"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON InfluxDB TO admin"

influx -execute "CREATE DATABASE mysql"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON mysql TO admin"

influx -execute "CREATE DATABASE nginx"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON nginx TO admin"

influx -execute "CREATE DATABASE phpmyadmin"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON phpmyadmin TO admin"

influx -execute "CREATE DATABASE Wordpress"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON Wordpress TO admin"

# Keep container running
tail -f /dev/null

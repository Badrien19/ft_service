# Start telegraf
/usr/bin/telegraf &

# Start influxdb
/usr/sbin/influxd & sleep 3

# Initialize database
influx -execute "CREATE DATABASE InfluxDB"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON InfluxDB TO admin"

# Keep container running
tail -f /dev/null

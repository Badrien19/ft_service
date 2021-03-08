mkdir -p /var/www/localhost
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv ./wordpress /var/www/localhost
rm latest.tar.gz

supervisord
mkdir -p /var/www/localhost
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv ./wordpress /var/www/localhost
rm latest.tar.gz
chown -R nginx:nginx /var/www/localhost/wordpress
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19 school/OU=Bourdanne squad/CN=localhost"
supervisord
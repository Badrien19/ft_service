FROM    alpine:3.12

RUN     apk update
RUN     apk add openssl pure-ftpd --repository=http://dl-3.alpinelinux.org/alpine/edge/testing/

#       Adding User (ftp_admin:ftp_pass)
RUN     mkdir -p /mnt/ftp/doss/
RUN     echo "Hello There" > /mnt/ftp/doss/file
RUN     adduser --home=/mnt/ftp -D ftp_admin && echo "ftp_admin:ftp_pass" | chpasswd

#       SSL
RUN     mkdir -p /etc/ssl/
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19 School/OU=Bourdanne/CN=localhost" \
        -keyout /etc/ssl/private/pure-ftpd.pem \
        -out /etc/ssl/private/pure-ftpd.pem

#       Supervisor
RUN     apk add --no-cache supervisor
RUN     mkdir -p /var/log/supervisor
COPY    ./supervisord.conf /etc/

#       Telegraf
RUN     apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY    telegraf.conf /etc/telegraf.conf

EXPOSE  21 21000-21003

CMD     supervisord
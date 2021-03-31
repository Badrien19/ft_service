FROM    alpine:3.12

RUN     apk update
RUN     apk add --no-cache openssl vsftpd

#       Adding User (ftp_admin:ftp_pass)
RUN     adduser --home=/mnt/ftp -D ftp_admin && echo "ftp_admin:ftp_pass" | chpasswd
RUN     mkdir -p /mnt/ftp/doss/
RUN     echo "Hello There" > /mnt/ftp/doss/file

#       Config file
COPY    vsftpd.conf /etc/vsftpd/
RUN     echo "ftp_admin" >> /etc/vsftpd/vsftpd.userlist

#       SSL
RUN     mkdir -p /etc/ssl/
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19 School/OU=Bourdanne/CN=localhost"

#       Supervisor
RUN     apk add --no-cache supervisor
RUN     mkdir -p /var/log/supervisor
COPY    ./supervisord.conf /etc/

EXPOSE  21 40000

CMD     supervisord
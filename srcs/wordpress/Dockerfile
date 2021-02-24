FROM alpine

RUN apt-get update && \
apt-get install -y wget && \
apt-get install -y curl && \
apt-get install -y mariadb-server mariadb-client

COPY ./src/wp-config.php .
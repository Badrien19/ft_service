FROM    alpine

RUN     apk update 
RUN     apk add --no-cache supervisor
RUN     apk add wget
RUN     apk add nginx

COPY nginx.conf /etc/nginx/conf.d/localhost.conf
RUN rm /etc/nginx/conf.d/default.conf 


EXPOSE  5050

COPY    setup.sh /tmp

CMD     sh /tmp/setup.sh
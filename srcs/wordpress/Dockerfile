FROM    alpine

RUN     apk update 
RUN     apk add --no-cache supervisor
RUN     apk add wget 

EXPOSE  5050

COPY    setup.sh /tmp

CMD     sh /tmp/setup.sh
FROM    alpine

RUN     apk update 
RUN     apk add --no-cache supervisor
RUN     apk add wget nginx && apk add openssl \
	    && apk add php7-fpm
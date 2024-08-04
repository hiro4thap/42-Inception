FROM debian:bullseye

RUN apt update -y \
	&& apt upgrade -y \
	&& apt install -y \
	php-fpm \
	php-mysqli \
	curl

RUN ls /etc/php/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY tool/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]

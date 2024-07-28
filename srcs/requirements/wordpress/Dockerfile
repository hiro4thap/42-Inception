FROM debian:latest

RUN apt update \
	&& apt upgrade \
	&& apt install -y \
	php-fpm

COPY www.conf /etc/php/8.2/fpm/pool.d/.

EXPOSE 80

CMD ["php-fpm8.2", "-F"]


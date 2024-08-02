FROM debian:buster

RUN apt update -y \
	&& apt upgrade -y \
	&& apt install -y \
	nginx

COPY default /etc/nginx/sites-available/.

RUN apt install -y openssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt \
		-subj "/C=AU/ST=South Australia/L=Adelaide/O=42Network/OU=student/CN=nginx_host_example"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

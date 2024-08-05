FROM debian:bullseye

RUN apt update -y \
	&& apt upgrade -y \
	&& apt install -y \
	nginx

COPY conf/default /etc/nginx/sites-available/.

### Command executed initially to generate certificate and key
# RUN mkdir -p /etc/ssl
# RUN apt install -y openssl
# 	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 		-out /etc/ssl/certs/nginx-selfsigned.crt \
# 		-keyout /etc/ssl/private/nginx-selfsigned.key \
# 		-subj "/C=AU/ST=South Australia/L=Adelaide/O=42Network/OU=student/CN=hiono.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

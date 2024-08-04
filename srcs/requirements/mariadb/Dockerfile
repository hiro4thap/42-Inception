FROM debian:bullseye

RUN apt update -y \
	&& apt upgrade -y \
	&& apt install -y \
	mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tool/init.sql /etc/mysql/init.sql
COPY tool/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["./script.sh"]


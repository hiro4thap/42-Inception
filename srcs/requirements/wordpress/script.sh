#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$db_name --dbuser=$db_admin_user --dbpass=$db_admin_pwd --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root
./wp-cli.phar user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PWD --allow-root

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F

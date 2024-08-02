#!/bin/bash

sed -i 's/DB_ADMIN_USER/'${db_admin_user}'/g' /etc/mysql/init.sql
sed -i 's/DB_NAME/'${db_name}'/g' /etc/mysql/init.sql
sed -i 's/DB_ADMIN_PWD/'${db_admin_pwd}'/g' /etc/mysql/init.sql
sed -i 's/DB_USER/'${db_user}'/g' /etc/mysql/init.sql
sed -i 's/DB_PWD/'${db_pwd}'/g' /etc/mysql/init.sql

if [ -d "/var/lib/mysql/$db_name" ]; then
  echo "database exists."
  mysqld_safe
else
  mysql_install_db
  mysqld
fi

exec "$@"%

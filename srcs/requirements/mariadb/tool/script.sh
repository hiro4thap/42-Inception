#!/bin/bash

DB_ADMIN_PWD=`cat ${DB_ADMIN_PWD_FILE}`
DB_PWD=`cat ${DB_PWD_FILE}`

sed -i 's/DB_ADMIN_USER/'${DB_ADMIN_USER}'/g' /etc/mysql/init.sql
sed -i 's/DB_NAME/'${DB_NAME}'/g' /etc/mysql/init.sql
sed -i 's/DB_ADMIN_PWD/'${DB_ADMIN_PWD}'/g' /etc/mysql/init.sql
sed -i 's/DB_USER/'${DB_USER}'/g' /etc/mysql/init.sql
sed -i 's/DB_PWD/'${DB_PWD}'/g' /etc/mysql/init.sql

if [ -d "/var/lib/mysql/$DB_NAME" ]; then
  echo "database exists."
  mysqld_safe
else
  mysql_install_db
  mysqld
fi

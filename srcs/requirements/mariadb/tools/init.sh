#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

cp /docker-entrypoint-initdb.d/init.sql /var/lib/mysql/init.sql

echo "Starting MariaDB..."

exec mysqld --bind-address=0.0.0.0 --init-file=/var/lib/mysql/init.sql


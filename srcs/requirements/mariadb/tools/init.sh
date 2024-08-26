#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:root /run/mysqld
chown -R mysql:mysql /var/lib/mysql

cat << EOF > /var/lib/mysql/init.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

chmod +x /var/lib/mysql/init.sql

echo "Starting MariaDB..."
exec mysqld --init-file=/var/lib/mysql/init.sql --bind-address=0.0.0.0


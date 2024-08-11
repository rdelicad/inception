#!/bin/sh

echo "Setting up MariaDB..."

# Create necessary directories
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Copy the SQL script to the appropriate directory
cp /docker-entrypoint-initdb.d/init.sql /var/lib/mysql/init.sql

# Run the MariaDB server with the initialization script
echo "Starting MariaDB..."
mariadbd --init-file=/var/lib/mysql/init.sql


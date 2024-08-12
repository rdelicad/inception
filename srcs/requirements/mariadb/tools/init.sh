#!/bin/sh

# Crear los directorios necesarios y ajustar permisos
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Esperar a que MariaDB esté disponible
echo "Esperando a que MariaDB esté listo..."
while ! mysql -uroot -p"$DB_ROOT_PASS" -e "SELECT 1" >/dev/null 2>&1; do
  >&2 echo "MariaDB no está disponible - esperando..."
  sleep 3
done

# Inicializar la base de datos
echo "Inicializando la base de datos..."
mysql -uroot -p"$DB_ROOT_PASS" <<-EOSQL
  CREATE DATABASE IF NOT EXISTS $DB_NAME;
  CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS';
  GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
  FLUSH PRIVILEGES;
EOSQL

# Iniciar MariaDB
echo "Iniciando MariaDB..."
exec mysqld --bind-address=0.0.0.0


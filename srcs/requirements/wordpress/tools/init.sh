#!/bin/bash

set -e

# waiting for the database to be ready
until mysql -hmariadb -uroot -p${DB_ROOT_PASS} -e "SHOW DATABASES;" > /dev/null 2>&1; do
  echo "waiting for mariadb to be available..."
  sleep 3
done

# Configure Wordpress users
wp core install --url=${WP_URL} --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} \
    --admin_email=${WP_ADMIN_EMAIL} --skip-email --path=/var/www/html

wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} --role=subscriber --path=/var/www/html

# Init PHP-FPM
exec php-fpm7.4 --nodaemonize


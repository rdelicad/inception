#!/bin/sh

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wp-config.php
sed -i "s/username_here/${DB_USER}/" /var/www/html/wp-config.php
sed -i "s/password_here/${DB_USER_PASS}/" /var/www/html/wp-config.php
sed -i "s/put your unique phrase here/${WP_SALT}/" /var/www/html/wp-config.php
sed -i "s/localhost/mariadb:3306/" /var/www/html/wp-config.php


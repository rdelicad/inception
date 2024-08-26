#!/bin/sh

wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /var/www/html

mkdir -p /run/php

chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g' /etc/php/7.4/fpm/pool.d/www.conf

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/${DB_USER}/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/${DB_USER_PASS}/" /var/www/html/wordpress/wp-config.php
sed -i "s/put your unique phrase here/${WP_SALT}/" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb:3306/" /var/www/html/wordpress/wp-config.php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core install --allow-root --url=${WP_URL} --title="Inception" \
   --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} \
   --admin_email=${WP_ADMIN_EMAIL} --skip-email --path=/var/www/html/wordpress

wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} \
   --path=/var/www/html/wordpress --url=${WP_URL}

wp theme install twentytwenty --activate --allow-root --path=/var/www/html/wordpress

exec php-fpm7.4 -F


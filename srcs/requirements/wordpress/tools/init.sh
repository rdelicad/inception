#!/bin/sh

# Descargar y descomprimir WordPress
wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /var/www/html

# Crear el directorio de PHP-FPM si no existe
mkdir -p /run/php

# Cambiar permisos del directorio de WordPress
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

# Configurar PHP-FPM para escuchar en el puerto 9000
sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g' /etc/php/7.4/fpm/pool.d/www.conf

# Copiar y configurar wp-config.php
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/${DB_USER}/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/${DB_USER_PASS}/" /var/www/html/wordpress/wp-config.php
sed -i "s/put your unique phrase here/${WP_SALT}/" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb:3306/" /var/www/html/wordpress/wp-config.php

# Descargar y configurar WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Instalar y configurar WordPress
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} \
    --admin_email=${WP_ADMIN_EMAIL} --skip-email --path=/var/www/html/wordpress

wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} --path=/var/www/html/wordpress --url=${WP_URL}

wp theme install astra --activate --allow-root
cp /var/www/html/inception_page.html /var/www/html/wordpress/wp-content/themes/astra/
cd /var/www/html/wordpress/wp-content/themes/astra/
wp post create --post_type=page --post_title='Inception' --post_content="$(cat /var/www/html/wordpress/wp-content/themes/astra/inception_page.html)" --post_status=publish --allow-root

# Iniciar PHP-FPM
exec php-fpm7.4 -F


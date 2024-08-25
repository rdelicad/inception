#!/bin/sh

wget -O /tmp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /tmp/wp-cli.phar
mv /tmp/wp-cli.phar /usr/local/bin/wp

wp core install --allow-root --url=${WP_URL} --title="WeLcOmEtOmYbLoG" \
   --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} \
   --admin_email=${WP_ADMIN_EMAIL} --skip-email --path=/var/www/html

wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} \
   --path=/var/www/html --url=${WP_URL}

wp theme install twentytwenty --activate --allow-root --path=/var/www/html

cp /var/www/html/inception_page.html /var/www/html/wp-content/themes/twentytwentyfour/
cd /var/www/html/wp-content/themes/twentytwentyfour/
wp post create --post_type=page --post_title='Inception Page' \
   --post_content="$(cat /var/www/html/inception_page.html)" --post_status=publish --allow-root --path=/var/www/html


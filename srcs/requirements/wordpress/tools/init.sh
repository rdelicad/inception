#!/bin/sh

# Set permissions
chown -R www-data:www-data /var/www/html
chmod 755 /var/www/html

# Start PHP-FPM
echo "Starting PHP-FPM"
exec php-fpm7.4 -F


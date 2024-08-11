# Use an official PHP image with FPM
FROM php:7.4-fpm

# Install dependencies and PHP extensions
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    unzip \
    wget \
    php-mysql \
    mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://wordpress.org/wordpress-6.5.5.tar.gz && \
    mkdir -p /var/www/html && \
    tar xfz wordpress-6.5.5.tar.gz -C /var/www/html --strip-components=1 && \
    rm wordpress-6.5.5.tar.gz
    

# Copy configure PHP-FPM
COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf

# Set permissions for the WordPress directory
RUN chown -R www-data:www-data /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]


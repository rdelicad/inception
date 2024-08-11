# Dockerfile for PHP-FPM
FROM debian:bullseye

# Install PHP-FPM and required extensions
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    php-fpm \
    php-mysql \
    wget \
    unzip \
    ca-certificates \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy PHP-FPM configuration
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Download and extract WordPress
RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    wget https://wordpress.org/latest.tar.gz && \
    tar xfz latest.tar.gz --strip-components=1 -C /var/www/html && \
    rm latest.tar.gz

COPY conf/wp-config.php /var/www/html/wp-config.php
COPY tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

# Expose port 9000
EXPOSE 9000

# Start PHP-FPM
CMD ["/usr/local/bin/init.sh"]


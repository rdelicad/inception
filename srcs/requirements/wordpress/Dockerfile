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

# Set up WordPress directory
RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Copy PHP-FPM configuration
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Copy WordPress configuration file
COPY conf/wp-config.php /var/www/html/wp-config.php

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar xfz latest.tar.gz --strip-components=1 -C /var/www/html && \
    rm latest.tar.gz

# Copy initialization script
COPY tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

# Expose port 9000
EXPOSE 9000

# Start PHP-FPM
CMD ["/usr/local/bin/init.sh"]


# Use an official PHP image with FPM
FROM php:7.4-fpm

# Install dependencies and PHP extensions
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libicu-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    wget \
    # Configure GD extension with FreeType and JPEG support
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    # Install required PHP extensions
    && docker-php-ext-install gd intl mysqli zip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/www/html

# Download and install WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Logs
RUN mkdir -p /var/log/php-fmp

# Configure PHP-FPM
COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf

# Set permissions for the WordPress directory
RUN chown -R www-data:www-data /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]


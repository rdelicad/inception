# Debian Bullseye
FROM debian:bullseye

# Install NGINX y OpenSSL
RUN set -eux; \
  apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \ 
  nginx \
  openssl \
  curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Copy file configuration NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/nginx_setup.sh /usr/local/bin/nginx_setup.sh
COPY tools/index.html /var/www/html

RUN chmod +x /usr/local/bin/nginx_setup.sh

# Exponer port 443
EXPOSE 443

# Command default init NGINX
CMD ["nginx_setup.sh"]

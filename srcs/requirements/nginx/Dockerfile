# Debian Bullseye
FROM debian:bullseye

# Install NGINX y OpenSSL
RUN	apt-get update && \
	apt-get install -y nginx openssl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Copy file configuration NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/nginx_setup.sh /usr/local/bin/nginx_setup.sh

RUN chmod +x /usr/local/bin/nginx_setup.sh

# Exponer port 443
EXPOSE 443

# Command default init NGINX
CMD ["nginx_setup.sh"]

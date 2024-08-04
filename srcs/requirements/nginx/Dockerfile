# Debian Bullseye
FROM debian:bullseye

# Install NGINX y OpenSSL
RUN	apt-get update && \
	apt-get install -y nginx openssl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Copy file configuration NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Exponer port 443
EXPOSE 443

# Command default init NGINX
CMD ["nginx", "-g", "daemon off;"]

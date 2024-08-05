#!/bin/sh

# Create the directory for SSL certificates
mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/nginx.key \	# Directory private key
-out /etc/nginx/ssl/nginx.crt \		# Directory certificate
-subj "/C=ES/L=MA/O=42/OU=student/CN=rdelicad"

# Start NGINX in foreground
nginx -g "daemon off;"




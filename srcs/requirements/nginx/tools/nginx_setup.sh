#!/bin/sh

# Create the directory for SSL certificates with proper permissions
mkdir -p /etc/nginx/ssl
chmod 755 /etc/nginx/ssl

# Generate a self-signed SSL certificate
if [ ! -f /etc/nginx/ssl/nginx.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=ES/L=Málaga/O=42/OU=student/CN=rdelicad.42.fr";
fi 

# Start NGINX in the foreground
nginx -g "daemon off;"


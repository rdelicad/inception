FROM debian:bullseye

RUN set -eux; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        vsftpd && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

# Create the necessary directory for vsftpd
RUN mkdir -p /var/run/vsftpd/empty

# Copy and set up the FTP user
COPY tools/setup-ftp.sh /usr/local/bin/setup-ftp.sh
RUN chmod +x /usr/local/bin/setup-ftp.sh

# Create the FTP directory
RUN mkdir -p /var/ftp && \
   	chown -R ftp:ftp /var/ftp && \
	chmod -R 755 /var/ftp

# Expose the FTP port
EXPOSE 21

# Start vsftpd service
CMD ["/usr/local/bin/setup-ftp.sh"]


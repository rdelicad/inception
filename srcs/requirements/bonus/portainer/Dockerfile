FROM debian:bullseye

# Set environment variable for the Portainer version
ENV PORTAINER_VERSION=2.18.4

RUN apt-get update && \
    apt-get install -y \
    curl \
    ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a directory to hold Portainer's persistent data
RUN mkdir -p /data

# Download Portainer, extract it, and place it in the /usr/local/bin directory
# This makes Portainer executable within the container
RUN curl -L https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz | tar -xz -C /usr/local/bin --strip-components=1

EXPOSE 9000

# Define the default command to run Portainer with data stored in the /data directory
CMD ["portainer", "--no-auth", "--data", "/data"]


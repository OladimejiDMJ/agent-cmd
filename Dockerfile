# Use Docker-in-Docker base image
FROM docker:20.10-dind

# Install bash
RUN apk add --no-cache bash

# Install Node.js
RUN apk add --no-cache nodejs npm

# Install Java
RUN apk add --no-cache openjdk17-jdk

# Install curl
RUN apk add --no-cache curl

# Install libc6-compat for glibc compatibility
RUN apk add --no-cache libc6-compat

# Install AWS CLI via pip for compatibility with Alpine
RUN apk add --no-cache python3 py3-pip && \
    pip install --no-cache-dir awscli

# Install Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install Docker CLI
RUN apk add --no-cache docker-cli

# Expose Docker daemon port
EXPOSE 2375

# Set the default working directory
WORKDIR /app

# Start Docker daemon
ENTRYPOINT ["dockerd-entrypoint.sh"]

# Default command
CMD ["bash"]

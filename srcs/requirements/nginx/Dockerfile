# Use the official Debian 11.9 base image
FROM debian:11.9

# Update package lists and install nginx and openssl
RUN apt-get -y update && apt-get install -y nginx openssl

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Copy nginx default configuration file to sites-enabled directory
COPY ./conf/default /etc/nginx/sites-enabled/

# Copy nginx_start.sh script to /etc directory
COPY ./tools/nginx_start.sh /etc

# Give execute permissions to nginx_start.sh script
RUN chmod +x /etc/nginx_start.sh

# Set the entry point for the container to nginx_start.sh script
ENTRYPOINT ["/etc/nginx_start.sh"]

# Set the default command to start nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]

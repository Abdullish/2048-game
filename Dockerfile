FROM ubuntu:22.04

# Install nginx, curl, zip, and unzip
RUN apt-get update && apt-get install -y nginx curl zip unzip

# Download and unzip the 2048 game into the default Nginx web root
RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master && \
    unzip /var/www/html/master.zip -d /var/www/html && \
    mv /var/www/html/2048-master/* /var/www/html/ && \
    rm -rf /var/www/html/2048-master /var/www/html/master.zip

# Expose port 80
EXPOSE 80

# Run nginx in foreground (don't mess with nginx.conf directly)
CMD ["nginx", "-g", "daemon off;"]

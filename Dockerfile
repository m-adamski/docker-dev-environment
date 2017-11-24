FROM ubuntu:16.04

# Update packages list & install required libraries
RUN apt-get update && apt-get install -y \
    software-properties-common

# Add External Repositories
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

# Update & install required packages
RUN apt-get update && apt-get install -y \
    nano \
    nginx \
    php7.1 \
    php7.1-cli \
    php7.1-common \
    php7.1-json \
    php7.1-opcache \
    php7.1-mysql \
    php7.1-mbstring \
    php7.1-mcrypt \
    php7.1-zip \
    php7.1-curl \
    php7.1-intl \
    php7.1-xml \
    php7.1-fpm

# Create main Virtual Hosts directory
RUN mkdir -p /var/www/vhosts

# Create certificates directory
RUN mkdir -p /usr/local/nginx/certificates

# Run PHP-FPM & NGINX Service
# CMD systemctl start php7.1-fpm && nginx -g daemon off
CMD ["nginx", "-g", "daemon off;"]

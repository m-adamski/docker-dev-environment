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
    php7.1-fpm \
    php7.1-cli \
    php7.1-common \
    php7.1-json \
    php7.1-opcache \
    php7.1-mysql \
    php7.1-mbstring \
    php7.1-mcrypt \
    php7.1-zip \
    php7.1-soap \
    php7.1-curl \
    php7.1-intl \
    php7.1-xml \
    php7.1-xdebug

# Create main Virtual Hosts directory
RUN mkdir -p /var/www/vhosts

# Create certificates directory
RUN mkdir -p /usr/local/nginx/certificates

# Create scripts directory
RUN mkdir -p /usr/local/nginx/scripts

# Remove default Virtual Host configuration
RUN rm /etc/nginx/sites-enabled/default && \
    rm /etc/nginx/sites-available/default

# Run additionals shell scripts and then run PHP-FPM, NGINX Services
CMD /bin/bash /usr/local/nginx/scripts/enable-vhosts.sh && \
    /bin/bash /usr/local/nginx/scripts/configure-xdebug.sh && \
    service php7.1-fpm start && nginx -g 'daemon off;'
FROM ubuntu:16.04

# Update packages list & install required libraries
RUN apt-get update && apt-get install -y \
    software-properties-common

# Add External Repositories
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2

# Update & install required packages
RUN apt-get update && apt-get install -y \
    nano \
    nginx \
    apache2 \
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
    php7.1-xdebug \
    libapache2-mod-fastcgi

# Create main Virtual Hosts directory
RUN mkdir -p /var/www/vhosts

# Create scripts and certificates directories
RUN mkdir -p /usr/local/nginx/certificates
RUN mkdir -p /usr/local/nginx/scripts
RUN mkdir -p /usr/local/apache/certificates
RUN mkdir -p /usr/local/apache/scripts
RUN mkdir -p /usr/local/php/scripts
RUN mkdir -p /usr/local/global/scripts

# Remove default NGINX and Apache Virtual Host configuration
RUN rm /etc/nginx/sites-enabled/default && \
    rm /etc/nginx/sites-available/default
RUN rm /etc/apache2/sites-enabled/000-default.conf && \
    rm /etc/apache2/sites-available/000-default.conf

# Enable Apache2 Modules & Configurations
RUN a2enmod rewrite ssl proxy_fcgi setenvif
RUN a2enconf php7.1-fpm

# Define arguments
ARG EXECUTE_WEB_SERVER

# Run additionals shell scripts and then run PHP-FPM and Web Server Services
CMD /bin/bash /usr/local/global/scripts/entrypoint.sh $EXECUTE_WEB_SERVER
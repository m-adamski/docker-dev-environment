FROM ubuntu:14.04

# Update packages list & install required libraries
RUN apt-get update && apt-get install -y \
    software-properties-common \
    python-software-properties

# Add External Repositories
RUN add-apt-repository -y ppa:ondrej/apache2
RUN add-apt-repository -y ppa:ondrej/php

# Update & install required packages
RUN apt-get update && apt-get install -y --force-yes \
    nano \
    apache2 \
    php7.1-fpm \
    php7.1-mysql \
    php7.1-mcrypt \
    php7.1-sqlite \
    php7.1-curl \
    php7.1-intl \
    php7.1-xml \
    php7.1-xdebug \
    libapache2-mod-fastcgi

# Configure XDebug
RUN echo "zend_extension=$(find /usr/lib/php/2016* -name xdebug.so)" > /etc/php/7.1/mods-available/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /etc/php/7.1/mods-available/xdebug.ini \
    && echo "remote_connect_back=on" >> /etc/php/7.1/mods-available/xdebug.ini

# Enable Apache2 Modules & Configurations
RUN a2enmod rewrite ssl proxy_fcgi setenvif
RUN a2enconf php7.1-fpm

# Run PHP-FPM & Apache2 Service
CMD service php7.1-fpm start && apache2ctl -DFOREGROUND

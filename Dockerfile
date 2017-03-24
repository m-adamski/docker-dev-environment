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
    libapache2-mod-fastcgi

# Enable Apache2 Modules & Configurations
RUN a2enmod actions rewrite ssl fastcgi proxy_fcgi alias
RUN a2enconf php7.1-fpm

# Run PHP-FPM & Apache2 Service
CMD service php7.1-fpm start && apache2ctl -DFOREGROUND

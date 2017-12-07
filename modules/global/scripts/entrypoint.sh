#!/bin/bash
if [ "$1" = "APACHE" ]; then
    echo "Starting Apache Web Server.."
    /usr/local/apache/scripts/enable-vhosts.sh && \
    /bin/bash /usr/local/php/scripts/configure-xdebug.sh && \
    service php7.1-fpm start && apache2ctl -DFOREGROUND
else
    echo "Starting NGINX Web Server.."
    /usr/local/nginx/scripts/enable-vhosts.sh && \
    /bin/bash /usr/local/php/scripts/configure-xdebug.sh && \
    service php7.1-fpm start && nginx -g 'daemon off;'
fi
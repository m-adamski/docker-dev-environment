#!/bin/bash
echo "xdebug.remote_enable=on" >> /etc/php/7.1/mods-available/xdebug.ini
echo "remote_connect_back=on" >> /etc/php/7.1/mods-available/xdebug.ini

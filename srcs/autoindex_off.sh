#!/bin/bash

cp /var/www/localhost/autoindex/nginx_autoindex_off.conf /etc/nginx/sites-available/localhost
service nginx restart
echo "autoindex off"

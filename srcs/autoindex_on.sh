#!/bin/bash

cp /var/www/localhost/autoindex/nginx.conf /etc/nginx/sites-available/localhost
service nginx restart
echo "autoindex on"

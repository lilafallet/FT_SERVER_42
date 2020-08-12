#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

service nginx start
service mysql start
service php7.3-fpm start

chown -R www-data /var/www/*
echo -e "${GREEN}[ ok ]${NC} The owner of /var/www and subdirectories (recursively) become the user www-data"
# www-data = web user on Ubuntu

################################################################################
# GENERATE WEBSITE FOLDER
################################################################################

mkdir /var/www/localhost
echo -e "${GREEN}[ ok ]${NC} Create the directory localhost"
# /var/www/localhost = where you will put the differents "applications" (wordpress, phpmyadmin)

################################################################################
# NGINX
################################################################################

mv ./tmp/nginx-conf /etc/nginx/sites-available
echo -e "${GREEN}[ ok ]${NC} Moove the configuration file of nginx in the default directory"
# /etc/nginx/sites-available = by default, on Debian Systems, Nginx server blocks configuration files are stored in this directory
ln -s /etc/nginx/sites-available/nginx-conf /etc/nginx/sites-enabled/
echo -e "${GREEN}[ ok ] ${NC} Create a symbolic link between sites-available and sites-enabled"
# the configuration file stock in the directory sites-enabled becomes available (active) by making a symbolic link between sites-enabled and sites-available

################################################################################
# SSL
################################################################################

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=no/OU=no/CN=lfallet/" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
echo -e "${GREEN}[ ok ]${NC} Generate the ssl certificate key"
echo -e "${GREEN}[ ok ]${NC} Create the directory /etc/ssl/certs/"
# openssl = generate the key
# nginx-selfsigned.key = key
# openssl req -newkey -keyout .key - out .crt = from the key, will create a certificate signature request file
# rsa:2048 = 2048 bits
# -subj ... = fields to be completed
# openssl req -newkey -x509 -days 365 = create a certificat x509 with a validity period of one year self-signed
# -nodes = don't protect the private key with a passphrase

################################################################################
# MYSQL
################################################################################

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo -e "${GREEN}[ ok ]${NC} Create new table -> wordpress"
# --skip-password = to not enter a password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo -e "${GREEN}[ ok ]${NC} Give all privilege to the root user"
# mysql -u root = execute mysql as root
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo -e "${GREEN}[ ok ]${NC} Change MySQL Server authentification plugin (password) for root user"
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

# if we want to INSERT, DELETE or UPDATE

################################################################################
# PHPMYADMIN
################################################################################

mkdir /var/www/localhost/phpmyadmin
echo -e "${GREEN}[ ok ]${NC} Create the directory /var/www/localhost/phpmyadmin"
# to have access to phpmyadmin with localhost
# to create an index phpmyadmin when the autoindex is on
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
echo -e "${GREEN}[ ok ]${NC} Download phpmyadmin"
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
echo -e "${GREEN}[ ok ]${NC} Decompress the instalation directory of phpmyadmin in /var/www/localhost/phpmyadmin"
# x = extract the archive
# v = print verbose
# f = target file
# --strip-components = give number of leading components from file names before extraction
# --strip-components 1 = will truncat only the file link of php and preserved the structure of the file /var/www/localhost/phpmyadmin
# -C = create the archive
mv ./tmp/phpmyadmin.inc.php /var/www/localhost/phpmyadmin/config.inc.php
echo -e "${GREEN}[ ok ]${NC} Replace the file config.inc.php by our configuration file of phpmyadmin${NC}"
echo "GRANT ALL ON *.* TO 'lila'@'localhost' IDENTIFIED BY 'hey123'" | mysql -u root
echo -e "${GREEN}[ ok ]${NC} User phpmyadmin : lila"
echo -e "${GREEN}[ ok ]${NC} Password phpmyadmin : hey123"
echo "FLUSH PRIVILEGES;" | mysql -u root

################################################################################
# WORDPRESS
################################################################################

cd /tmp/
wget https://wordpress.org/latest.tar.gz
echo -e "${GREEN}[ ok ]${NC} Download wordpress"
tar -xzvf latest.tar.gz
echo -e "${GREEN}[ ok ]${NC} Decompress the instalation directory of wordpress"
mv wordpress /var/www/localhost
echo -e "${GREEN}[ ok ]${NC} Moove the instalation directory of wordpress in /var/www/localhot"
mv /tmp/wp-config.php /var/www/localhost/wordpress/wp-config.php
echo -e "${GREEN}[ ok ]${NC} Replace the file wp-config.php by our configuration file of wordpress${NC}"

################################################################################
# LAUNCH
################################################################################

service nginx restart
tail -f /var/log/nginx/access.log /var/log/nginx/error.log 
sleep infinity

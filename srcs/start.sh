GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


service nginx start
echo -e "${GREEN}nginx start${NC}"
service mysql start
echo -e "${GREEN}mysql start\n${NC}"
service php7.3-fpm start
echo -e "${GREEN}phpmyadmin start\n${NC}"

chown -R www-data /var/www/*
echo -e "${GREEN}creation of the file www-data and move in /var/www/ ${RED}A REVOIR !!\n${NC}"
chown -R 755 /var/www/*
echo -e "${GREEN}give all the rights to the owner and the read and execution to the other in the directory /var/www\n${NC}"

# GENERATE WEBSITE FOLDER

mkdir /var/www/localhost
echo -e "${GREEN}creation of the directory localhost and creation of the file index.php\n${NC}"

# NGINX

mv ./tmp/nginx-conf /etc/nginx/sites-available
echo -e "${GREEN}mv the file configuration of nginx in the directory /etc/nginx/sites-available/localhost\n${NC}"
ln -s /etc/nginx/sites-available/nginx-conf /etc/nginx/sites-enabled/
echo -e "${GREEN}creation of a symbolic link between sites-available and sites-enabled\n${NC}"

# SSL

mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=no/OU=no/CN=lfallet/" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
echo -e "${GREEN}creation of the directory '/etc/nginx/ssl' where we will ad the key\n${NC}"
echo -e "${GREEN}generate a certificate self-signed${NC}"
echo -e "${GREEN}The self-signed SSL certificate is generated from the server.key private key and server.csr files${NC}"
echo -e "${GREEN}The server.crt file is your site certificate suitable for use with Heroku’s SSL add-on along with the server.key private key.\n${NC}"


# MYSQL

echo "CREATE DATABASE wordpress;"  | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "exit;" 
echo -e "${GREEN}tell to mysql to work with the database.sql file wich contain the database of Wordpress and Phpmyadmin\n${NC}"

# PHPMYADMIN

mkdir /var/www/localhost/phpmyadmin
echo -e "${GREEN}create the directory /var/www/localhost/phpmyadmin\n${NC}"
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
echo -e "${GREEN}download content of phpmyamin\n${NC}"
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
echo -e "${GREEN}decompress the file\n${NC}"
# x = extract the archive
# v = print what is going on
# f = tell the file to decompress
# --strip-components = give number of leading components from file names before extraction# --strip-components 1 = will truncat only the file link of php and preserved the structure of the file /var/www/localhost/phpmyadmin
# -C = create the archive
mv ./tmp/phpmyadmin.inc.php /var/www/localhost/phpmyadmin/config.inc.php
echo -e "${GREEN}replace the file config.inc.php by the configuration file of phpmyadmin\n${NC}"

# WORDPRESS

#cd /tmp/
#echo -e "${GREEN}moove in the directory tmp\n${NC}"
#wget -c https://wordpress.org/latest.tar.gz
#echo -e "${GREEN}download wordpress\n${NC}"
#tar -xvzf latest.tar.gz
#echo -e "${GREEN}decompress the file\n${NC}"
#mv wordpress/ /var/www/localhost
#echo -e "${GREEN}moove the file in /var/www/localhost\n${NC}"
#mv /tmp/wp-config.php /var/www/localhost/wordpress
#echo -e "${GREEN}moove the configuration file of wordpress in /var/www/localhost\n${NC}"

wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
mv wordpress /var/www/localhost
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
rm -rf /etc/nginx/sites-enabled/default
#mv var/www/localhost/wp-config.php /etc/nginx/wp-config.php

service nginx restart
echo -e "${GREEN}nginx restart\n${NC}"
bash

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

mkdir /var/www/localhost && touch /var/www/localhost/index.php
echo -e "${GREEN}creation of the directory localhost and creation of the file index.php\n${NC}"
echo "<?php phpinfo(); ?>" >> /var/www/localhost/index.php
echo -e "${GREEN} copy the string '<?php phpinfo(); ?>' in the file index.php ${RED}A REVOIR !!\n${NC}"


# SSL

mkdir /etc/nginx/ssl
echo -e "${GREEN}creation of the directory '/etc/nginx/ssl' where we will ad the key\n${NC}"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
echo -e "${GREEN}generate a certificate self-signed${NC}"
echo -e "${GREEN}The self-signed SSL certificate is generated from the server.key private key and server.csr files${NC}"
echo -e "${GREEN}The server.crt file is your site certificate suitable for use with Heroku’s SSL add-on along with the server.key private key.\n${NC}"

# NGINX

mv ./tmp/nginx.conf /etc/nginx/sites-available/localhost
echo -e "${GREEN}mv the file configuration of nginx in the directory /etc/nginx/sites-available/localhost\n${NC}"
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
echo -e "${GREEN}creation of a symbolic link between sites-available and sites-enabled\n${NC}"
rm -rf /etc/nginx/sites-enabled/default
echo -e "${GREEN}delete the directory by default of sites-enabled\n${NC}"

# MYSQL

mysql < ./tmp/database.sql
echo -e "${GREEN}tell to mysql to work with the database.sql file wich contain the database of Wordpress and Phpmyadmin\n${NC}"

# PHPMYADMIN

mkdir /var/www/localhost/phpmyadmin
#echo -e "${GREEN}delete the directory by default of sites-enabled\n${NC}"

while true; do sleep 1000; done

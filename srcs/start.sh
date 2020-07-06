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

while true; do sleep 1000; done

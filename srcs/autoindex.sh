#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

case $1 in
	"ON")
		echo -e "${GREEN}AUTOINDEX ON${NC}"
		sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/nginx-conf
		# if autoindex is on OFF, replace by ON
		# else if already on ON, do nothing
		service nginx restart
		# restart nginx
		echo  ""
		;;
	"OFF")
		echo -e "${RED}AUTOINDEX OFF${NC}"
		sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-enabled/nginx-conf
		# if autoindex is on ON, replace by OFF
		# else if already on OFF, do nothing
		service nginx restart
		# restart nginx
		echo ""
		;;
	*)
		echo -e "\e[31mERROR = ENTER ON OR OFF"
		echo -n -e "\e[32mAUTOINDEX IS : "
		echo | grep '\(autoindex on\|autoindex off\)' /etc/nginx/sites-enabled/nginx-conf | cut -c13-
		# if the argument is different of ON or OFF, return an error
		echo -e "\e[39m"
		;;
esac

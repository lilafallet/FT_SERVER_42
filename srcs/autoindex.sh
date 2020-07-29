#!/bin/bash

case $1 in
	"ON")
		echo -e "\e[32mAUTOINDEX ON\e[39m"
		sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/nginx-conf
		service nginx restart
		echo  ""
		;;
	"OFF")
		echo -e "\e[31mAUTOINDEX OFF\e[39m"
		sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-enabled/nginx-conf
		service nginx restart
		echo ""
		;;
	*)
		echo -e "\e[31mERROR = ENTER ON OR OFF"
		echo -n -e "\e[32mAUTOINDEX IS : "
		echo | grep '\(autoindex on\|autoindex off\)' /etc/nginx/sites-enabled/nginx-conf | cut -c13-
		echo -e "\e[39m"
		;;
esac

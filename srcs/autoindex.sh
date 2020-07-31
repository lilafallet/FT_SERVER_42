#!/bin/bash

case $1 in
	"ON")
		echo -e "\e[32mAUTOINDEX ON\e[39m"
		sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-enabled/nginx-conf
		# if autoindex is on OFF, replace by ON
		# else if already on ON, do nothing
		service nginx restart
		# restart nginx
		echo  ""
		;;
	"OFF")
		echo -e "\e[31mAUTOINDEX OFF\e[39m"
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
		echo -e "\e[39m"
		;;
esac

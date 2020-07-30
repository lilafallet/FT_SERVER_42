#!/bin/bash

FILE80="/tmp/port80"
FILE443="/tmp/port443"

if [ -z "$1"  ]; then
	rm -f $FILE80 $FILE443
	exit 1
fi
	
if [ ! -f $FILE80 ]; then
	sudo lsof -i -P -n | grep LISTEN | grep ":80" | cut -d " " -f1 | sort -u > $FILE80
fi
if [ ! -f $FILE443 ]; then
	sudo lsof -i -P -n | grep LISTEN | grep ":443" | cut -d " " -f1 | sort -u > $FILE443
fi

if [ "$1" == "start" ]; then
	sudo service `cat $FILE80` start 2>/dev/null
	sudo service `cat $FILE443` start 2>/dev/null
	rm -f $FILE80 $FILE443
elif [ "$1" == "stop" ]; then
	sudo service `cat $FILE80` stop 2>/dev/null
	sudo service `cat $FILE443` stop 2>/dev/null
else
	rm -f $FILE80 $FILE443
	exit 1
fi
exit 0

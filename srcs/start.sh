#!/bin/sh

mkdir nginx
touch nginx/ip_address.txt
wget -qO- http://ipecho.net/plain > nginx/ip_address.txt

#while true; do sleep 1000; done

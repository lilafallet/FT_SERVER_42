FROM debian:buster

RUN apt-get update && apt-get install -y \

##NGINX

apt update
apt upgrade
apt install nginx

sudo apt-get install systemd

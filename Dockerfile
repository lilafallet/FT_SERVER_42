FROM debian:buster-slim

RUN apt-get -y update && apt-get -y install nginx
#install nginx
RUN apt-get -y update && apt-get -y install vim
#install vim
RUN apt-get -y update && apt-get -y install default-mysql-server
#install mysql
RUN apt-get -y update && apt-get -y install wget
#install wget -> ligne de commande non interractif de telechargements de
#fichier depuis le web
RUN apt-get -y update && apt-get -y install php php-mysql php-fpm php-cli \ 
												php-mbstring php-zip php-gd \
#install phpmyadmin

COPY /srcs/nginx.conf ./root/
#copy the file configuration for nginx
COPY /srcs/WORDPRESS/ ./root/
#copy the directory of wordpress
COPY /srcs/WORDPRESS/wp-config-sample.php ./root/
#copy the file configuration of wordpress
COPY /srcs/PHPMYADMIN/config.sample.inc.php ./root/


WORKDIR /root/

ENTRYPOINT ["bash", "start.sh"]

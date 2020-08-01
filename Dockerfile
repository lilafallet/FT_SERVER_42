FROM debian:buster

MAINTAINER lfallet <lfallet@student.42.fr>

RUN apt-get update && apt-get install -y procps
# command line utility
RUN apt-get -y update && apt-get -y install nano
# text file editor
RUN apt-get -y update && apt-get -y install nginx
# install web server
RUN apt-get -y update && apt-get -y install wget
# install download tools
RUN apt-get -y update && apt-get -y install mariadb-server
# install SGDB
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
# install php/mysql

COPY ./srcs/start.sh ./
# copy the script to run the container inside the root of the container's file system
COPY ./srcs/autoindex.sh ./tmp/autoindex.sh
# copy the script to handle the autoindex
COPY ./srcs/nginx-conf ./tmp/nginx-conf
# copy the nginx's file configuration
COPY ./srcs/phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php
# copy the phpmyadmin's file configuration
COPY ./srcs/wp-config.php ./tmp/wp-config.php
# copy the wordpress's file configuration

ENTRYPOINT ["bash", "start.sh"]

FROM debian:buster

RUN apt-get update && apt-get install -y procps
# utilitaire en ligne de commande
RUN apt-get -y update && apt-get -y install nano
# editeur de fichiers textes
RUN apt-get -y update && apt-get -y install nginx
# install web server
RUN apt-get -y update && apt-get -y install wget
# install download tools
RUN apt-get -y update && apt-get -y install mariadb-server
# install database
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
# install phpmyadmin

COPY ./srcs/start.sh ./root
COPY ./srcs/database.sql ./root/tmp/database.sql
COPY ./srcs/nginx.conf ./root/tmp/nginx.conf
COPY ./srcs/phpmyadmin_conf.php ./root/tmp/phpmyadmin_conf.php
COPY ./srcs/wordpress_conf.php ./root/tmp/wordpress_conf.php

WORKDIR /root/

ENTRYPOINT ["bash", "start.sh"]

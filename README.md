## FT_SERVER_42

> REMOVE ALL STOPPED CONTAINERS / ALL NETWORKS NOT USED BY AT LEAST ONE CONTAINER / ALL DANGLING IMAGES / ALL DANGLING BUILD CACHE
``$> docker system prune``
> BUILD THE IMAGE
``$>docker build -t test .``
> RUN IMAGE AS A CONTAINER
``$>docker run -it -p 80:80 -p 443:443 test``
> PRINT LIST OF CONTAINERS
``$>docker ps -a``
> TO RUN A COMMAND IN A RUIING CONTAINER
``$>docker exec -ti [container's name] bash``
> STOP A CONTAINER
``$>docker stop [container's name]``

## PHPMYADMIN

* USER phpmyadmin : lila
* MDP phpmyadmin : hey123

## SI PORT 80 OU 443 UTILISE

* STOP PORT 80/443 : bash srcs/port.sh stop
* START PORT 80/443 : bash srcs/port.sh start

## SI APACHE2 / MARCHE TOUJOURS PAS

* sudo vim /etc/apache2/ports.conf
* sudo vim /etc/apache2/sites-available/default.ssl.conf
* sudo vim /etc/apache2/sites-available/000-default.conf

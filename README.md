## FT_SERVER_42

##### REMOVE ALL STOPPED CONTAINERS / ALL NETWORKS NOT USED BY AT LEAST ONE CONTAINER / ALL DANGLING IMAGES / ALL DANGLING BUILD CACHE :
``$> docker system prune``
##### BUILD THE IMAGE :
``$> docker build -t test .``
##### RUN IMAGE AS A CONTAINER :
``$> docker run -it -p 80:80 -p 443:443 test``
##### PRINT LIST OF CONTAINERS :
``$> docker ps -a``
##### TO RUN A COMMAND IN A RUNING CONTAINER :
``$> docker exec -ti [container's name] bash``
##### STOP A CONTAINER :
``$> docker stop [container's name]``

## PHPMYADMIN

* USER phpmyadmin : lila
* MDP phpmyadmin : hey123

## IF PORT 80 IS ALREADY USE

##### STOP PORT 80/443 : 
``$> bash srcs/port.sh stop``
##### START PORT 80/443 :
``$> bash srcs/port.sh start``

## IF STILL DOESN'T WORK AND PORT 80 IS USED BY APACHE2

* ``$> sudo vim /etc/apache2/ports.conf``
* ``$> sudo vim /etc/apache2/sites-available/default.ssl.conf``
* ``$> sudo vim /etc/apache2/sites-available/000-default.conf``

## IF STILL DOESN'T WORK
``$> docker run -it -p 4000:80 -p 443:443 test``

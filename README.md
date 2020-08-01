# FT_SERVER_42

docker system prune
docker build -t test .
docker run -it -p 80:80 -p 443:443 test
docker ps -a
docker exec -ti [nom container] bash
docker stop [nom container]

USER phpmyadmin : lila
MDP phpmyadmin : hey123

STOP PORT 80/443 : bash srcs/port.sh stop
START PORT 80/443 : bash srcs/port.sh start

SI APACHE2 / MARCHE TOUJOURS PAS

sudo vim /etc/apache2/ports.conf

FROM debian:buster
RUN apt-get update && apt-get install -y \
						nginx \
						vim \
						wget \
COPY ./root
WORKDIR ./root
EXPOSE 80
CMD

docker build -t [nom de l'image] .
docker run -p 80:80 [nom de l'image]
-y -> permet de dire YES partout pour les installations

FROM debian:buster-slim

RUN apt-get -y update && apt-get -y install nginx \
						vim \
						wget

COPY srcs ./root/

WORKDIR /root/

ENTRYPOINT ["bash", "container_entrypoint.sh"]

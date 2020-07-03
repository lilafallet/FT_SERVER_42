FROM debian:buster-slim

RUN apt-get -y update && apt-get -y install nginx \
						systemd \
						vim \
						wget

COPY srcs ./root/

WORKDIR /root/

ENTRYPOINT ["bash", "start.sh"]

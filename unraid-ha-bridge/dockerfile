FROM openjdk:8-alpine

MAINTAINER leonowski

VOLUME ["/config"]

wget \
oracle-java8-installer \
oracle-java8-set-default && \
usermod -u 99 nobody && \
usermod -g 100 nobody && \
mkdir -p /etc/my_init.d

COPY firstrun.sh /etc/my_init.d/firstrun.sh

RUN chmod +x /etc/my_init.d/firstrun.sh

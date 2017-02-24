FROM openjdk:8-alpine

MAINTAINER leonowski

VOLUME ["/config"]


COPY firstrun.sh /etc/my_init.d/firstrun.sh

RUN chmod +x /etc/my_init.d/firstrun.sh
CMD ["/etc/my_init.d/firstrun.sh"]

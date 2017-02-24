FROM mono:latest

# Use baseimage-docker's init system.
#CMD ["/sbin/my_init"]

#ENV DEBIAN_FRONTEND="noninteractive" \
#    TERM="xterm"

RUN apt-get update && apt-get install -y --no-install-recommends gdebi-core usbutils ca-certificates-mono && apt-get clean -y

ADD homegenie-beta_1.1.r526_all.deb /tmp/

RUN gdebi --non-interactive /tmp/homegenie-beta_1.1.r526_all.deb 

RUN mkdir /etc/service/homegenie

ADD homegenie.runit /etc/service/homegenie/run

RUN chmod +x /etc/service/homegenie/run

# cleanup
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

#VOLUME /usr/local/bin/homegenie

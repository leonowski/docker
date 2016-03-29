FROM phusion/baseimage

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y gdebi-core usbutils && apt-get clean -y

ADD http://downloads.sourceforge.net/project/homegenie/homegenie-beta_1.1.r515_all.deb /tmp/

RUN gdebi --non-interactive /tmp/homegenie-beta_1.1.r515_all.deb 

RUN mkdir /etc/service/homegenie

ADD homegenie.runit /etc/service/homegenie/run

RUN chmod +x /etc/service/homegenie/run

# cleanup
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

VOLUME /usr/local/bin/homegenie

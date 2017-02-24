#!/bin/bash

usermod -u 99 nobody && \
usermod -g 100 nobody && \
mkdir -p /etc/my_init.d
mkdir -p /config

#Get docker env timezone and set system timezone

apk update
apk upgrade
apk add ca-certificates && update-ca-certificates
# Change TimeZone
apk add --update tzdata
ENV tz=america/los_angeles



cd /config
if [ ! -z $VERSION ]; then
  echo "Manual version override:" $VERSION
else
  #Check the latest version on github
  VERSION="$(curl -sX GET https://api.github.com/repos/bwssytems/ha-bridge/releases/latest | grep 'tag_name' | cut -d\" -f4)"
  VERSION=${VERSION:1}
  echo "Latest version on bwssystems github repo is" $VERSION
fi

if [ ! -f /config/ha-bridge-"$VERSION".jar ]; then
  echo "Installing version '$VERSION'"
  wget https://github.com/bwssytems/ha-bridge/releases/download/v"$VERSION"/ha-bridge-"$VERSION".jar
else
  echo "Using existing version '$VERSION'"
fi
echo "Setting correct permissions"
chown -R nobody:users /config

ADDPARAM="-Dupnp.config.address=$SERVERIP -Dserver.port=$SERVERPORT"
echo -e "Parameters used:\nServer IP : $SERVERIP\nServer Port : $SERVERPORT"

echo "Starting Home Automation Bridge"
java -jar $ADDPARAM ha-bridge-"$VERSION".jar 2>&1 | tee /config/ha-bridge.log

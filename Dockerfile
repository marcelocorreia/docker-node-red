FROM debian:jessie-slim
MAINTAINER Marcelo Correia <marcelo.correia@starvisitor.com>

RUN apt-get update -y
RUN apt-get install curl git -y
RUN apt-get install build-essential libssl-dev -y
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs mysql-client net-tools
RUN echo "Installing deps"
RUN npm install -g --unsafe-perm node-red
RUN npm install -g node-red-node-serialport
RUN npm install -g node-red-contrib-cron
RUN npm install -g node-red-contrib-moment2
RUN npm install -g node-red-node-mongodb
RUN npm install -g node-red-contrib-bigtimer
RUN npm install -g node-red-contrib-google
RUN npm install -g node-red-contrib-mock
RUN npm install -g node-red-contrib-os
RUN npm install -g node-red-contrib-date
RUN npm install -g node-red-node-mysql
RUN npm install -g node-red-contrib-screenshot
RUN npm install -g node-red-contrib-youtube
RUN npm install -g node-red-contrib-chromecast
RUN npm install -g node-red-contrib-redis
RUN npm install -g node-red-contrib-fluentd-parser
RUN npm install -g node-red-contrib-elasticsearch3
RUN npm install -g node-red-node-youtube
RUN npm install -g node-red-contrib-aws
RUN npm install -g node-red-dashboard
RUN npm install -g node-red-contrib-soapserver
RUN npm install -g node-red-contrib-slack
RUN npm install -g nodegit

RUN mkdir /opt/node-red
EXPOSE 1880

CMD node-red -u /opt/node-red
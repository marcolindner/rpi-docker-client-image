FROM resin/rpi-raspbian:jessie
ENV PATH /opt/node:$PATH
RUN apt-get upgrade; 
RUN apt-get update;
RUN apt-get install -y wget;

# Install NodeJs for Raspberry Pi 2
RUN wget http://nodejs.org/dist/latest-v4.x/node-v4.5.0-linux-armv6l.tar.gz         
RUN tar -xvf node-v4.5.0-linux-armv6l.tar.gz
RUN cd node-v4.5.0-linux-armv6l
RUN sudo cp -avr * /usr/local/
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

#Build app
RUN npm run build

# Bundle app source
COPY dist/* /usr/src/app/

EXPOSE 8080
CMD [ "npm", "start" ]
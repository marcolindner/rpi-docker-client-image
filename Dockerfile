FROM resin/rpi-raspbian:jessie
RUN apt-get upgrade; 
RUN apt-get update;
RUN apt-get install -y wget;

# Install NodeJs for Raspberry Pi 2

RUN wget https://nodejs.org/dist/v6.6.0/node-v6.6.0-linux-armv6l.tar.gz
RUN tar -xvzf node-v6.6.0-linux-armv6l.tar.gz
RUN rm node-v6.6.0-linux-armv6l.tar.gz
RUN mv node-v6.6.0-linux-armv6l opt/node

ENV PATH $PATH:/opt/node/bin

RUN node -v


# Create app directory
RUN mkdir -p /usr/src/dist
WORKDIR /usr/src/dist

# Install app dependencies
COPY package.json /usr/src/dist/
RUN npm install

#Build app
#RUN npm run build

# Bundle app source
COPY dist/* /usr/src/dist/

EXPOSE 8080
CMD [ "npm", "start" ]
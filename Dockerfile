FROM node:4-slim
EXPOSE 3000

COPY . /usr/src/app

RUN apt-get update && apt-get install bzip2
RUN apt-get -y install libfontconfig
RUN npm install phantomjs -g
RUN npm install pm2 -g

WORKDIR /usr/src/app
RUN npm install

CMD pm2 start --no-daemon --max-memory-restart 100M server.js

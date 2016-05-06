FROM node:4-slim
EXPOSE 3000

COPY . /usr/src/app

RUN apt-get update && apt-get install bzip2
RUN apt-get -y install libfontconfig
RUN npm install phantomjs -g

CMD cd /usr/src/app && npm install && npm start

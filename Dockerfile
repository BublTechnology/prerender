FROM node:4-slim
EXPOSE 3000

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
      bzip2 \
      libfontconfig \
    && rm -rf /var/lib/apt/lists/*
RUN npm install phantomjs pm2 -g

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
COPY package.json $APP_HOME
WORKDIR $APP_HOME
RUN npm install

COPY . /usr/src/app

CMD ["pm2", "start", "--no-daemon", "--max-memory-restart", "100M", "server.js"]

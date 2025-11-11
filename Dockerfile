FROM node:18

ENV MONGO_DB_USERNAME=dharma \
    MONGO_DB_PWD=dharma

WORKDIR /testapp

COPY package*.json ./

RUN npm install --production

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]

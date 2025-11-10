FROM node

ENV MONGO_DB_USERNAME=dharma \
    MONGO_DO_PWD=dharma

RUN mkdir -p testapp

COPY . /testapp

CMD ["node", "/testapp/server.js"]
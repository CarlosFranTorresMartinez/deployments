FROM mongo:latest

ENV MONGO_INITDB_ROOT_USERNAME=develop
ENV MONGO_INITDB_ROOT_PASSWORD=vallegrande
ENV MONGO_INITDB_DATABASE=tutorias

COPY ./mongo-init.js /docker-entrypoint-initdb.d/

CMD ["mongod", "--auth", "--bind_ip_all"]

VOLUME /data/db
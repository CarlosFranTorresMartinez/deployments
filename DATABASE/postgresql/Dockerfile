FROM postgres:alpine

ENV POSTGRES_USER=develop
ENV POSTGRES_PASSWORD=vallegrande

COPY ./init.sql /docker-entrypoint-initdb.d/

VOLUME /var/lib/postgresql/data
FROM postgres:alpine

ENV POSTGRES_USER=develop
ENV POSTGRES_PASSWORD=develop123

COPY ./initv2.sql /docker-entrypoint-initdb.d/

VOLUME /var/lib/postgresql/data
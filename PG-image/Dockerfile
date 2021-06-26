FROM postgres:alpine

COPY src/iris.sql /docker-entrypoint-initdb.d/

RUN chmod a+r /docker-entrypoint-initdb.d/*



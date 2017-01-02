FROM gordlea/postgis:9.5
MAINTAINER Dmitry Kiselev <dmitry@endpoint.com>

ENV POSTGRES_USER gis
ENV POSTGRES_DB gis

ADD *.sql /docker-entrypoint-initdb.d/

FROM golang:1.4
MAINTAINER Basil Veerman <bveerman@uvic.ca>, \
           Dmitry Kiselev <dmitry@endpoint.com>

RUN echo "deb http://ftp.de.debian.org/debian sid main " >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y bzip2 \
  postgresql-client \
  libgeos-3.5.0 libprotobuf-dev libleveldb-dev \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

WORKDIR $GOPATH

ADD https://imposm.org/static/rel/imposm3-0.3.0dev-20161206-e67cf93-linux-x86-64.tar.gz /tmp/imposm3.tar.gz

RUN tar -xzvf /tmp/imposm3.tar.gz \
  && mv imposm3-0.3.0dev-20161206-e67cf93-linux-x86-64 imposm3 \
  && rm /tmp/imposm3.tar.gz

#RUN ln -s /usr/lib/x86_64-linux-gnu/libgeos-3.5.1.so /usr/lib/x86_64-linux-gnu/libgeos-3.5.0.so

ADD import-terrain.sh /usr/local/bin/

ENTRYPOINT /bin/bash

FROM debian:stable
MAINTAINER Dmitry Kiselev <dmitry@endpoint.com>

RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive

# Essentials
RUN apt-get update \
  && apt-get install -y \
    tmux \
    vim \
    nano \
    curl \
    unzip \
    osm2pgsql \
  && rm -rf /var/lib/apt/lists/*

ADD import-carto.sh /usr/local/bin

ENTRYPOINT /bin/bash

FROM kotaimen/mapnik
MAINTAINER Dmitry Kiselev <dmitry@endpoint.com>

RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive

# Lates node ppa
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh \
  && bash nodesource_setup.sh

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    tmux \
    vim \
    nano \
    curl \
    unzip \
    fonts-noto-cjk fonts-noto-hinted fonts-noto-unhinted ttf-unifont \
    fonts-dejavu-core \
    nodejs \
    postgresql-client \
    python-pip \
    python-imaging python-yaml libproj-dev \
    libgeos-dev python-lxml libgdal-dev python-shapely \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g carto \
  && npm install -g millstone \
  && npm install -g kosmtik \
  && node /usr/lib/node_modules/kosmtik/index.js plugins --reinstall \

RUN pip install --upgrade pip \
  && pip install nik4 \
  && pip install MapProxy

RUN mkdir /opt/mapproxy

ADD mapnik.yaml /opt/mapproxy/mapnik.yaml
ADD entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /opt/mapproxy/

EXPOSE 8080

ENTRYPOINT /usr/local/bin/entrypoint.sh
#ENTRYPOINT /bin/bash

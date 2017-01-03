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
    git \
    vim \
    nano \
    curl \
    wget \
    unzip \
    fonts-noto-cjk fonts-noto-hinted fonts-noto-unhinted ttf-unifont \
    fonts-dejavu-core \
    nodejs \
    gdal-bin \
    pv \
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

### Install tilemill


RUN mkdir /opt/tilemill &&\
  cd /opt/tilemill &&\
  git clone https://github.com/tilemill-project/tilemill.git && \
  cd tilemill && \
  npm install

## Install Imposm

RUN \
  wget http://imposm.org/static/rel/imposm3-0.1dev-20140811-3f3c12e-linux-x86-64.tar.gz && \
  tar xvf imposm3-0.1dev-20140811-3f3c12e-linux-x86-64.tar.gz && \
  mv imposm3-0.1dev-20140811-3f3c12e-linux-x86-64 /opt/imposm3 && \
  rm imposm3-0.1dev-20140811-3f3c12e-linux-x86-64.tar.gz

ENV PATH $PATH:/opt/imposm3

# Install tessera
RUN npm install -g tessera ;\
  npm install -g tilelive mapnik tilelive-mapnik tilelive-blend tilelive-carto tilelive-http

#Change hillshade source
ADD tessera.json /opt/shared/styles/terrain-classic/tessera.json

ADD import.sh /usr/local/bin/import.sh

WORKDIR /opt/shared/styles/terrain-classic

RUN npm install pgexplode

EXPOSE 6789

ENTRYPOINT /usr/local/bin/entrypoint.sh
#ENTRYPOINT /bin/bash

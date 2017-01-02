#!/bin/bash

#node /usr/lib/node_modules/kosmtik/index.js serve /opt/shared/styles/openstreetmap-carto/project.mml

# if [ ! -f /opt/shared/styles/openstreetmap-carto/mapnik.xml ]; then
#   echo "Generating /opt/shared/styles/openstreetmap-carto/mapnik.xml"
#   carto /opt/shared/styles/openstreetmap-carto/project.mml > /opt/shared/styles/openstreetmap-carto/mapnik.xml
# fi

#mapproxy-util serve-develop --bind 0.0.0.0:8080 mapnik.yaml &
tessera -S 50 -c tessera.json --port 6789

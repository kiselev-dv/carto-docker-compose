#!/bin/bash

psql --host=postgis -U gis terrain -c "CREATE EXTENSION IF NOT EXISTS POSTGIS;"
psql --host=postgis -U gis terrain -c "CREATE EXTENSION IF NOT EXISTS HSTORE;"

imposm3 import -connection postgis://gis:passwd@postgis/terrain  \
  -mapping /opt/shared/styles/terrain-classic/imposm3_mapping.json \
  -read $1 -write

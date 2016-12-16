#!/bin/bash

psql --host=postgis -U gis terrain -c "CREATE EXTENSION IF NOT EXISTS POSTGIS;"
psql --host=postgis -U gis terrain -c "CREATE EXTENSION IF NOT EXISTS HSTORE;"

/go/imposm3/imposm3 -connection postgis://gis:passwd@postgis/terrain  

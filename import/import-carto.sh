#!/bin/bash

osm2pgsql -c -d gis -H postgis -U gis -S /opt/shared/styles/openstreetmap-carto/openstreetmap-carto.style $1

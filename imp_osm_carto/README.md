## Enter container

```
docker-compose run import /bin/bash
```

## Import data

```
osm2pgsql -c -d gis -H postgis -U gis -S /opt/shared/styles/openstreetmap-carto/openstreetmap-carto.style /opt/shared/osm_dumps/new-york-latest.osm.pbf
```

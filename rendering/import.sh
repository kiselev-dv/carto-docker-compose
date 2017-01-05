cd /opt/shared/styles/terrain-classic

imposm3 import --cachedir /tmp/cache \
  -overwritecache \
  -deployproduction \
  -mapping=imposm3_mapping.json \
  -connection="$DATABASE_URL" \
  -write \
  -read=$1

 psql --host postgis -U gis terrain -f sql/functions/osm_admin_area.sql
 psql --host postgis -U gis terrain -f sql/functions/highroad.sql
 psql --host postgis -U gis terrain -f sql/functions/aries_labels.sql
 psql --host postgis -U gis terrain -f sql/functions/admin1_labels.sql
 psql --host postgis -U gis terrain -f sql/functions/highway_shields.sql

после импорта, если не заимпортировались в паблик imposm3 -deployproduction

export DATABASE_URL=postgres://gis:passwd@postgis/terrain

1. make db/shared
2. make db/NY
3. make
4. make xml
5. npm install -g tessera
6. npm install -g tilelive mapnik tilelive-mapnik tilelive-blend tilelive-carto tilelive-http
7. tessera -S 50 -c tessera.json --port 6789

## Installation

### Prerequirements

* Docker
* Docker-compose

### Installation

1. `git clone`
2. create folders:
  * `shared_volume/osm_dumps`
  * `shared_volume/styles`
3. clone https://github.com/stamen/terrain-classic to
  `shared_volume/styles/terrain-classic`
4. build docker images
  ```
  cd docker_compose
  docker-compose build
  ```
5. run docker-compose
  ```
  cd docker_compose
  docker-compose up
  ```
6. First run will create `dockercompose_pg_data` data volume
  OSM data for the whole world, use about 500G of space
  to move it, create symlinc for mount point:

  ```bash
  docker volume inspect dockercompose_pg_data
  # My ount point is:
  # Mountpoint": "/var/lib/docker/volumes/dockercompose_pg_data/_data"

  # copy data to new folder:
  mkdir /media/data/dockercompose_pg_data_volume
  sudo cp -r /var/lib/docker/volumes/dockercompose_pg_data/_data /media/data/dockercompose_pg_data_volume/_data
  sudo rm -R /var/lib/docker/volumes/dockercompose_pg_data

  # make symlink to location has enought space
  sudo ln -s /media/data/dockercompose_pg_data_volume /var/lib/docker/volumes/dockercompose_pg_data
  ```


### Initialization

1. Download OSM dump (35G)
  ```
  wget http://planet.osm.org/pbf/planet-latest.osm.pbf
  ```
2. Run docker-compose
  ```
  docker-compose up -d
  ```
3. Run `make db/CA`. We want to import whole planet, but we still need to run
  `make db/CA` to have database initialized.

  ```
  # Enter container
  docker-compose exec rendering bash

  make db/CA
  make db/shared

  # that will create tables and data scheme in import schema.
  # we need to rotate it to public:
  imposm3 import -connection "$DATABASE_URL" -mapping imposm3_mapping.json -deployproduction
  ```

### Import data.
  imposm3 use /tmp/cache dir. Check, that you have enough space.
  Uncomment and edit related volume in `docker-compose.yaml`

  ```
  # Enter container
  docker-compose exec rendering bash

  import.sh /opt/shared/osm_dumps/planet-latest.osm.pbf
  ```

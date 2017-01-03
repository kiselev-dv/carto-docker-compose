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
3. Import data

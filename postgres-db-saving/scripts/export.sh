#!/bin/bash

if [[ -z "$1" ]];
then
  echo "Usage $0 <docker-container-hash> <databases>";
  exit 1;
fi;

container_hash=$1
databases=$2

function dump_database() {
  local container_hash=$1
  local database=$2

  docker exec -u 0 $container_hash bash -c "pg_dump -U $database -d $database -F c -f /docker-entrypoint-initdb.d/$database.dump";
}

for database in $(echo $databases | tr ',' ' ');
do
  dump_database $container_hash $database;
done;
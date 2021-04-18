#!/bin/bash

while ! nc -z $DB_ADDR $DB_PORT </dev/null;
do
  echo \"http://$DB_ADDR:$DB_PORT is not ready yet.\";
  sleep 2;
done;

/opt/jboss/tools/docker-entrypoint.sh -b 0.0.0.0
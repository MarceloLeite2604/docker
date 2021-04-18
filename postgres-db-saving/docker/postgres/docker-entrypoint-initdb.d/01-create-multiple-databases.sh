#!/bin/bash

set -eu

function create_user_and_database() {
  local database=$1;
  echo "Creating user and database \"$database\".";
  psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOL
    CREATE USER $database WITH ENCRYPTED PASSWORD '$database';
    CREATE DATABASE $database;
    GRANT ALL PRIVILEGES ON DATABASE $database TO $database;
EOL
}

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; 
then
  echo "Multiple databases creation requested: $POSTGRES_MULTIPLE_DATABASES.";

  for database in $(echo $POSTGRES_MULTIPLE_DATABASES | tr ',' ' ');
  do
    create_user_and_database $database;
  done;

  echo "Multiple databases created."
fi;
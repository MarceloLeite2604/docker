#!/bin/bash

set -eu

dump_files=$(find $(dirname "${BASH_SOURCE[0]}") -name \*.dump | xargs echo);

if [[ -n "$dump_files" ]];
then
  for dump_file in $(echo $dump_files | tr ',' ' ');
  do
    echo "Restoring dump file \"$dump_file\".";
    filename=$(basename -- "$dump_file");
    database="${filename%.*}";
    pg_restore -U "$POSTGRES_USER" -F c -d $database $dump_file;
  done;
fi;
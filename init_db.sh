#!/bin/bash

cp src/iris.csv pgdata
cp upload_iris_data.cmd pgdata

docker exec -it postgressive psql -U postgres -d andreas_db -f /var/lib/postgresql/data/upload_iris_data.cmd

#!/bin/bash

docker run --rm --name postgressive -v /root/lab/pgdata:/var/lib/postgresql/data -e POSTGRES_PASSWORD=nomadrid -e POSTGRES_DB=andreas_db -p 6666:5432 -d registry.digitalocean.com/carand-contreg/pgservice

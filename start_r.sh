#!/bin/bash

docker run -d --name r4 -e DBPASS -p 3000:3000 registry.digitalocean.com/carand-contreg/rminimal


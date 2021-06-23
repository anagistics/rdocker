#!/bin/bash

docker stop r4
docker rm r4

cd /root/lab
docker build -t rminimal --file Dockerfile .
docker tag rminimal registry.digitalocean.com/carand-contreg/rminimal
docker push registry.digitalocean.com/carand-contreg/rminimal


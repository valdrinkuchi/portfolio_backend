#!/bin/sh

set -e
docker-compose stop && docker rmi -f $(docker images -a -q)
echo $MASTER_KEY > master.key,
echo $CREDENTIALS > credentials.yml.enc
docker-compose up -d
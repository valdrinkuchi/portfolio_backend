#!/bin/sh

set -e
docker-compose stop && docker-compose rm -f
echo $MASTER_KEY > master.key
docker-compose up -d
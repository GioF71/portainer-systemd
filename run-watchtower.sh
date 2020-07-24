#!/bin/sh

docker stop watchtower
docker rm watchtower

docker pull containrrr/watchtower:latest

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --restart unless-stopped \
  --name watchtower \
  containrrr/watchtower

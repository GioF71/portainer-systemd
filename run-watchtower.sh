#!/bin/sh

docker stop watchtower
docker rm watchtower

docker pull containrrr/watchtower:latest

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/timezone:/etc/timezone:ro \
  --e WATCHTOWER_POLL_INTERVAL=36000 \
  --restart unless-stopped \
  --name watchtower \
  containrrr/watchtower

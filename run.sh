#!/bin/sh

docker stop portainer
docker rm portainer

docker volume create portainer_data
docker pull portainer/portainer-ce:latest

docker run -d \
  -p 8000:8000 \
  -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  --restart unless-stopped \
  --name portainer \
  portainer/portainer-ce

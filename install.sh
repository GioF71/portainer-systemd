#!/bin/sh

cp portainer.service /etc/systemd/system/portainer.service
systemctl daemon-reload
systemctl enable portainer
systemctl start portainer

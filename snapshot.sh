#!/bin/sh
IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

echo "CREATE DOCKER CUSTOM FILE..."
mkdir -p /etc/systemd/system/docker.service.d/
echo """[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H tcp://${IP}:2375 -H unix:///var/run/docker.sock
""" > /etc/systemd/system/docker.service.d/custom.conf

echo "RESTART DOCKER..."
systemctl daemon-reload && systemctl restart docker

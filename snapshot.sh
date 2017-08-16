#!/bin/sh
IP=$(/sbin/ifconfig eth0 | awk '/inet addr/ {split ($2,A,":"); print A[2]}');

echo "CREATE DOCKER CUSTOM FILE..."
mkdir -p /etc/systemd/system/docker.service.d/
echo """[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H tcp://${IP}:2375 -H unix:///var/run/docker.sock
""" > /etc/systemd/system/docker.service.d/custom.conf

#!/bin/sh
https://raw.githubusercontent.com/gofn/snapshot.service/master/snapshot.sh > /usr/local/bin/snapshot.sh
chmod +x /usr/local/bin/snapshot.sh
curl https://raw.githubusercontent.com/gofn/snapshot.service/master/gofn.service > /etc/systemd/system/gofn.service
systemctl enable gofn.service

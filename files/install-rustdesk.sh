#!/bin/bash

# move executables to binary directory
mv hbbr /usr/bin/hbbr
mv hbbs /usr/bin/hbbs

# move services to systemd services directory
mv rustdesk-hbbr.service /usr/lib/systemd/system/
mv rustdesk-hbbs.service /usr/lib/systemd/system/

# create log and working diretories
mkdir -p /var/log/rustdesk-server
mkdir -p /var/lib/rustdesk-server

# reload systemd, start and enable services
systemctl daemon-reload

systemctl start rustdesk-hbbr
systemctl start rustdesk-hbbs

systemctl enable rustdesk-hbbr
systemctl enable rustdesk-hbbs

#!/bin/bash

set -e -x

PUID=${PUID:-1024}
PGID=${PGID:-100}

groupmod -o -g "$PGID" app
usermod -o -u "$PUID" app

cat > /etc/rsyncd.conf <<'EOF'
uid        = app
gid        = app
use chroot = yes
charset    = utf-8
pid file   = /var/run/rsyncd.pid
timeout    = 300

[backup]
    path      = /backup
    comment   = Backup Area
    read only = false
EOF

exec rsync --no-detach --daemon

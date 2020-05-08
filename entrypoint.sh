#!/bin/sh

PUID=${PUID:-1024}
PGID=${PGID:-100}

groupmod -o -g "$PGID" app
usermod -o -u "$PUID" app

set -e -x

exec rsync --no-detach --daemon --config /app/rsyncd.conf

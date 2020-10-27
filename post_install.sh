#!/bin/sh

## add user to match up with rslsync guide
pw user add rslsync -c rslsync -u 817 -d /nonexistent -s /usr/bin/nologin

## create rslsync db and bin folder
mkdir -p /var/db/rslsync
chown rslsync:rslsync /var/db/rslsync
mkdir -p /usr/local/bin

## install bin
fetch -o /tmp https://download-cdn.resilio.com/stable/FreeBSD-x64/resilio-sync_freebsd_x64.tar.gz
tar xvzf /tmp/resilio-sync_freebsd_x64.tar.gz
cp rslsync /usr/local/bin
rm /tmp/resilio-sync_freebsd_x64.tar.gz

# enable the service
sysrc -f /etc/rc.conf rslsync_enable="YES"

# start the service
service rslsync start 2>/dev/null

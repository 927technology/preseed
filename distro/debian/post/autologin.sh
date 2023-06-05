#!/bin/bash

username=${1}

#create username if not present
getent passwd ${username} || adduser -G docker -d /home/${username} -s /bin/bash -m ${username}

#configure autologin
[ ! -d /etc/systemd/system/getty@.service.d ] && mkdir /etc/systemd/system/getty@.service.d

cat << EOF > /etc/systemd/system/getty@.service.d/autologin.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noclear --autologin ${username} %I $TERM
EOF
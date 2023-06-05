#!/bin/bash

cat << EOF > ~player/.xinitrc
matchbox-window-manager & \
    attract
EOF
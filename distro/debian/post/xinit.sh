#!/bin/bash

apt install -y xinit

#allow anybody to spawn a x instance
echo allowed_users=anybody > /etc/X11/Xwrapper.config
#!/bin/bash

#change into installers root
chsh /target

#set hostname
/usr/bin/echo ${1} > /etc/hostname

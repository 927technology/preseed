#!/bin/bash

#prerequesites
apt install -y git

#set xinitrc script
cat << 'EOF_xinitrc' > /home/player/.xinitrc
#!/bin/bash
/usr/bin/matchbox-window-manager & /usr/local/bin/attract
EOF_xinitrc

chown root:player /home/player/.xinitrc
chmod 750 /home/player/.xinitrc

#set bashrc script
rm -f /home/player/.bashrc

cat << 'EOF_bashrc' > /home/player/.bashrc
#!/bin/bash
/usr/bin/startx
EOF_bashrc

chown root:player /home/player/.bashrc
chmod 750 /home/player/.bashrc

#add player permission groups for xserver
usermod -aG audio,docker,tty,video player

#get git setup for arcade
[ ! -d /home/player/git ] && mkdir -p /home/player/git
cd /home/player/git
[ ! -d /home/player/git/arcade ] && git clone https://github.com/927technology/arcade.git
[ -d /home/player/.attract ] && rm -rf /home/player/.attract
[ -f /home/player/.attract ] && rm -f /home/player/.attract
[ -L /home/player/.attract ] && unlink /home/player/.attract
ln -s ./git/arcade/config/.attract /home/player/.attract
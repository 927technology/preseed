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
mkdir -p /home/player/git
cd /home/player/git
git clone https://github.com/927technology/arcade.git
ln -s ./git/arcade/config/.attract /home/player/.attract
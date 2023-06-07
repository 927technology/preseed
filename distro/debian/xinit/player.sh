#!/bin/bash

cat << EOF > /home/player/.xinitrc
#!/bin/bash
/usr/bin/matchbox-window-manager & /usr/local/bin/attract
EOF 

chown root:player /home/player/.xinitrc
chmod 750 /home/player/.xinitrc

rm -f /home/player/.bashrc

cat << EOF > /home/player/.bashrc
#!/bin/bash
/usr/bin/startx
EOF

chown root:player /home/player/.bashrc
chmod 750 /home/player/.bashrc

usermod -aG audio,docker,tty,video player
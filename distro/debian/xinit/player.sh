#!/bin/bash

cat << EOF_xinitrc > /home/player/.xinitrc
#!/bin/bash
/usr/bin/matchbox-window-manager & /usr/local/bin/attract
EOF_xinitrc 

chown root:player /home/player/.xinitrc
chmod 750 /home/player/.xinitrc

rm -f /home/player/.bashrc

cat << EOF_bashrc > /home/player/.bashrc
#!/bin/bash
/usr/bin/startx
EOF_bashrc

chown root:player /home/player/.bashrc
chmod 750 /home/player/.bashrc

usermod -aG audio,docker,tty,video player
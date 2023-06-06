#!/bin/bash

cat << EOF > /home/player/.xinitrc
#!/bin/bash
/usr/bin/matchbox-window-manager & /usr/local/bin/attract
EOF 

chmod 700 /home/player/.xinitrc

cat << EOF > /home/player/.bashrc
#!/bin/bash
startx
EOF

chmod 700 /home/player/.bashrc
#!/bin/bash
useradd -m -G wheel -s /bin/bash pocoyo
passwd -d pocoyo
echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/99-wheel-nopasswd
cat > /home/pocoyo/.bash_profile << 'EOF'
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec dbus-run-session startplasma-wayland
fi
EOF
chown pocoyo:pocoyo /home/pocoyo/.bash_profile

#!/bin/bash
set -e

# Disable SDDM completely
systemctl disable sddm.service -f 2>/dev/null || true
rm -f /etc/systemd/system/display-manager.service 2>/dev/null || true

# Root has no password by default in archiso, but let's be sure
passwd -d root

# Configure auto-start of Plasma Wayland on tty1 for root
mkdir -p /root/.config
cat > /root/.bash_profile << 'EOF'
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec dbus-run-session startplasma-wayland
fi
EOF

# Ensure the bash profile is sourced
echo "source ~/.bash_profile" >> /root/.bashrc

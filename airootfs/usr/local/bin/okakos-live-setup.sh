#!/bin/bash


# Disable SDDM completely
systemctl disable sddm.service -f 2>/dev/null || true
rm -f /etc/systemd/system/display-manager.service 2>/dev/null || true

# Configure auto-start of Plasma Wayland on tty1 for root
mkdir -p /root/.config
cat > /root/.bash_profile << 'EOF'
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    dbus-run-session startplasma-wayland
fi
EOF

# Ensure the bash profile is sourced only once
if ! grep -q "source ~/.bash_profile" /root/.bashrc 2>/dev/null; then
    echo "source ~/.bash_profile" >> /root/.bashrc
fi

exit 0

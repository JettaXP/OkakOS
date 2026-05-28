#!/bin/bash

systemctl disable sddm.service -f 2>/dev/null || true
rm -f /etc/systemd/system/display-manager.service 2>/dev/null || true

mkdir -p /root/.config/fish/conf.d
cat > /root/.config/fish/conf.d/autostart.fish << 'EOF'
if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
    dbus-run-session startplasma-wayland
end
EOF

exit 0

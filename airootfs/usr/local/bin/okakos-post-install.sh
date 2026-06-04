#!/bin/bash
set -e

echo "[OkakOS] Starting post-install configuration..."

cat > /etc/os-release << 'OSEOF'
NAME="OkakOS"
PRETTY_NAME="OkakOS 67"
ID=okakos
ID_LIKE=arch
BUILD_ID=rolling
VERSION="67"
VERSION_ID="67"
HOME_URL="https://jettax.xyz/okakos"
BUG_REPORT_URL="https://github.com/jettaxp/okakos"
SUPPORT_URL="https://t.me/jettaxp"
LOGO=okakos
OSEOF

cat > /etc/lsb-release << 'LSBEOF'
DISTRIB_ID=OkakOS
DISTRIB_RELEASE=67
DISTRIB_DESCRIPTION="OkakOS 67"
LSBEOF

echo "[OkakOS] os-release configured"

chmod +x /usr/local/bin/pocoyo-optimizator 2>/dev/null || true
chmod +x /usr/local/bin/67wm-troll 2>/dev/null || true
chmod +x /usr/local/bin/start-67wm 2>/dev/null || true
chmod +x /usr/local/bin/welcome 2>/dev/null || true
chmod +x /usr/local/bin/okakos-welcome 2>/dev/null || true

echo "[OkakOS] Scripts made executable"

if [ -f /etc/default/grub ]; then
    sed -i 's/^GRUB_DEFAULT=.*/GRUB_DEFAULT=0/' /etc/default/grub
    sed -i 's/^GRUB_DISTRIBUTOR=.*/GRUB_DISTRIBUTOR="OkakOS 67"/' /etc/default/grub

    if ! grep -q "GRUB_BACKGROUND" /etc/default/grub; then
        echo 'GRUB_BACKGROUND="/usr/share/grub/background.jpg"' >> /etc/default/grub
    fi

    if command -v grub-mkconfig &> /dev/null; then
        grub-mkconfig -o /boot/grub/grub.cfg 2>/dev/null || true
    fi
fi

echo "[OkakOS] GRUB configured"

NEW_USER=$(ls /home/ 2>/dev/null | head -1)
if [ -n "$NEW_USER" ] && command -v fish &> /dev/null; then
    chsh -s /usr/bin/fish "$NEW_USER" 2>/dev/null || true
    echo "[OkakOS] Fish shell set for $NEW_USER"
fi

pacman-key --populate artix 2>/dev/null || true

rc-update add sddm default 2>/dev/null || true
rc-update add NetworkManager default 2>/dev/null || true
rc-update add elogind default 2>/dev/null || true
rc-update add dbus default 2>/dev/null || true

echo "[OkakOS] Services enabled"

if [ -n "$NEW_USER" ]; then
    pacman -S --noconfirm --needed base-devel git 2>/dev/null || true
fi

if [ ! -f /etc/hostname ] || [ "$(cat /etc/hostname 2>/dev/null)" = "okakiso" ]; then
    echo "OkakOS" > /etc/hostname
fi

echo "[OkakOS] Hostname configured"

rm -f /etc/sddm.conf.d/autologin.conf 2>/dev/null || true
rm -f /etc/runlevels/default/okakos67 2>/dev/null || true
rm -f /etc/init.d/okakos67 2>/dev/null || true
rm -f /etc/conf.d/agetty.tty1 2>/dev/null || true
rm -rf /etc/calamares 2>/dev/null || true
rm -f /root/.config/fish/conf.d/plasma-autostart.fish 2>/dev/null || true

if [ -n "$NEW_USER" ]; then
    rm -f /home/$NEW_USER/.config/fish/config.fish 2>/dev/null || true
fi

echo "[OkakOS] Live-ISO artifacts cleaned"

mkdir -p /etc/fish/conf.d

echo "[OkakOS] Post-install complete!"

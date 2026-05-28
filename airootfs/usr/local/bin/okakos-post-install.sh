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

cp -f /run/archiso/airootfs/etc/fastfetch/config.jsonc /etc/fastfetch/config.jsonc 2>/dev/null || mkdir -p /etc/fastfetch && cp /etc/fastfetch/config.jsonc /etc/fastfetch/config.jsonc 2>/dev/null || true
cp -rf /run/archiso/airootfs/usr/share/fastfetch/logos /usr/share/fastfetch/ 2>/dev/null || true

cp -rf /run/archiso/airootfs/etc/fish /etc/ 2>/dev/null || true
cp -rf /run/archiso/airootfs/etc/skel /etc/ 2>/dev/null || true

cp -rf /run/archiso/airootfs/usr/share/backgrounds /usr/share/ 2>/dev/null || true
cp -f /run/archiso/airootfs/usr/share/grub/background.jpg /usr/share/grub/background.jpg 2>/dev/null || true

cp -f /run/archiso/airootfs/usr/local/bin/pocoyo-optimizator /usr/local/bin/ 2>/dev/null || true
cp -f /run/archiso/airootfs/usr/local/bin/67wm-troll /usr/local/bin/ 2>/dev/null || true
cp -f /run/archiso/airootfs/usr/local/bin/welcome /usr/local/bin/ 2>/dev/null || true
cp -f /run/archiso/airootfs/usr/local/bin/okakos-welcome /usr/local/bin/ 2>/dev/null || true
chmod +x /usr/local/bin/pocoyo-optimizator /usr/local/bin/67wm-troll /usr/local/bin/welcome /usr/local/bin/okakos-welcome 2>/dev/null || true

cp -rf /run/archiso/airootfs/usr/share/wayland-sessions /usr/share/ 2>/dev/null || true
cp -rf /run/archiso/airootfs/usr/share/applications /usr/share/ 2>/dev/null || true

cp -f /run/archiso/airootfs/etc/issue /etc/issue 2>/dev/null || true
cp -f /run/archiso/airootfs/etc/motd /etc/motd 2>/dev/null || true

echo "[OkakOS] Custom files copied"

if [ -f /etc/default/grub ]; then
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

systemctl enable sddm.service -f 2>/dev/null || true
systemctl enable NetworkManager.service -f 2>/dev/null || true

echo "[OkakOS] Services enabled"

if [ -n "$NEW_USER" ]; then
    pacman -S --noconfirm --needed base-devel git 2>/dev/null || true

    su - "$NEW_USER" -c "
        cd /tmp
        rm -rf yay-bin
        git clone https://aur.archlinux.org/yay-bin.git
        cd yay-bin
        makepkg -si --noconfirm
        cd /tmp
        rm -rf yay-bin
    " 2>/dev/null || echo "[OkakOS] WARNING: yay installation failed (no internet?)"
fi

echo "[OkakOS] yay installation attempted"

if [ ! -f /etc/hostname ] || [ -z "$(cat /etc/hostname 2>/dev/null)" ]; then
    echo "OkakOS" > /etc/hostname
fi

echo "[OkakOS] Hostname configured"

rm -f /etc/sddm.conf.d/autologin.conf 2>/dev/null || true
rm -f /etc/systemd/system/okakos67.service 2>/dev/null || true
rm -rf /etc/calamares 2>/dev/null || true

echo "[OkakOS] Live-ISO artifacts cleaned"

mkdir -p /etc/fish/conf.d

echo "[OkakOS] Post-install complete!"

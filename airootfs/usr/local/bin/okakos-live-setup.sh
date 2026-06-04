#!/bin/bash
chmod +x /usr/local/bin/* 2>/dev/null || true
grep -q "/usr/bin/fish" /etc/shells || echo "/usr/bin/fish" >> /etc/shells
rc-update del sddm default 2>/dev/null || true
exit 0

#!/bin/bash
systemctl disable sddm.service -f 2>/dev/null || true
rm -f /etc/systemd/system/display-manager.service 2>/dev/null || true
exit 0

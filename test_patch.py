          import os

          packages_path = '../okakos-profile/packages.x86_64'
          if not os.path.exists(packages_path):
              packages_path = 'packages.x86_64'
          
          pkgs = []
          if os.path.exists(packages_path):
              with open(packages_path, 'r', encoding='utf-8') as f:
                  pkgs = [line.strip() for line in f if line.strip() and line.strip() != 'calamares']
          
          if 'yay-bin' not in pkgs:
              pkgs.insert(0, 'yay-bin')
          
          pkgs_str = " ".join(pkgs)

          for root, dirs, files in os.walk('.'):
              for file in files:
                  if file.endswith('.py') or file.endswith('.json'):
                      path = os.path.join(root, file)
                      with open(path, 'r', encoding='utf-8') as f:
                          content = f.read()
                      new_content = content.replace("xf86-video-vmware", "xorg-xinit")
                      if new_content != content:
                          with open(path, 'w', encoding='utf-8') as f:
                              f.write(new_content)
          
          guided_path = 'okakinstall/scripts/guided.py'
          if os.path.exists(guided_path):
              with open(guided_path, 'r') as f:
                  content = f.read()
                  
              replace_from_main = 'installation.genfstab()'
              replace_to_main = f"""import subprocess, os
          TABTABif os.path.exists("/mnt/etc"):
          TABTABTABsubprocess.run("cp -a /tmp/custom_repo /mnt/var/tmp/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run('echo "" >> /mnt/etc/pacman.conf; echo "[custom]" >> /mnt/etc/pacman.conf; echo "SigLevel = Optional TrustAll" >> /mnt/etc/pacman.conf; echo "Server = file:///var/tmp/custom_repo" >> /mnt/etc/pacman.conf', shell=True)
          TABTABTABsubprocess.run("arch-chroot /mnt pacman -Sy --noconfirm --needed {pkgs_str} || true", shell=True)
          TABTABTABsubprocess.run("mkdir -p /mnt/etc/skel /mnt/usr/share/fastfetch/logos /mnt/usr/local/bin /mnt/etc/fastfetch /mnt/etc/fish /mnt/etc/polkit-1/rules.d /mnt/etc/default", shell=True)
          TABTABTABsubprocess.run("cp -a /etc/skel/. /mnt/etc/skel/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /etc/fish/. /mnt/etc/fish/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /etc/fastfetch/. /mnt/etc/fastfetch/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /etc/default/grub /mnt/etc/default/grub 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /usr/share/backgrounds /mnt/usr/share/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /usr/share/gnome-background-properties /mnt/usr/share/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /usr/share/grub /mnt/usr/share/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /usr/share/fastfetch/logos/okakos /mnt/usr/share/fastfetch/logos/okakos 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /usr/share/applications /mnt/usr/share/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("rm -f /mnt/usr/share/applications/okakinstall.desktop /mnt/usr/share/applications/calamares.desktop 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /usr/local/bin/* /mnt/usr/local/bin/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /etc/polkit-1/rules.d/* /mnt/etc/polkit-1/rules.d/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp -a /etc/xdg/autostart /mnt/etc/xdg/ 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("chmod +x /mnt/usr/local/bin/* 2>/dev/null", shell=True)
          TABTABTABsubprocess.run("cp /usr/local/bin/okakos-post-install.sh /mnt/root/ && arch-chroot /mnt bash /root/okakos-post-install.sh && rm -f /mnt/root/okakos-post-install.sh", shell=True)
          TABTABinstallation.genfstab()""".replace("TAB", chr(9))
              content = content.replace(replace_from_main, replace_to_main)
              with open(guided_path, 'w') as f:
                  f.write(content)

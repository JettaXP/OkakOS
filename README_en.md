<div align="right">
  <a href="README.md"><img src="https://img.shields.io/badge/🇷🇺-Русский-2196F3?style=for-the-badge" alt="RU" /></a>
  <a href="README_en.md"><img src="https://img.shields.io/badge/🇬🇧-English-E53935?style=for-the-badge" alt="EN" /></a>
</div>

# OkakOS 67 🚀

<div align="center">

```
  /$$$$$$  /$$$$$$$$
 /$$__  $$|_____ $$ 
| $$  \__/     /$$/ 
| $$$$$$$     /$$/  
| $$__  $$   /$$/   
| $$  \ $$  /$$/    
|  $$$$$$/ /$$/     
 \______/ |__/      
```

**The most okak Linux distro based on Arch!**

[![Build OkakOS ISO](https://github.com/jettaxp/okakos/actions/workflows/blank.yml/badge.svg)](https://github.com/jettaxp/okakos/actions/workflows/blank.yml)

[🌐 Website](https://jettax.xyz/okakos) • [📦 Download ISO](https://github.com/jettaxp/okakos/releases) • [💬 Telegram](https://t.me/jettaxp)

</div>

---

## What is OkakOS?

**OkakOS 67** is a custom Linux distribution built on Arch Linux. Created for those who want a ready-to-use system without having to configure everything from scratch, but with a touch of humor and easter eggs.

The number **67** (Six Seven) is our mascot, symbol, and philosophy. It's everywhere: in the ASCII art on boot, in the name of the "window manager", and in the installer slideshow. Why 67? Because we can.

## ✨ Features

### 🖥️ Desktop
- **KDE Plasma** out of the box — a full-featured, beautiful, and customizable desktop
- **SDDM** — display manager with auto-login in live mode
- **Foot** — a fast and lightweight terminal for Wayland

### 🐟 Shell
- **Fish** — a friendly shell, set as the default
- Custom prompt: `user@OkakOS ~/directory ~>`
- If you enter a non-existent command, you'll receive a friendly greeting 🤝

### 📦 Pre-installed Software
- **fastfetch** — shows system info with OkakOS branding
- **yay** — AUR helper for installing packages from the AUR
- **Konsole** + **Dolphin** — standard KDE applications
- **Pocoyo Optimizator** — a ~~very useful~~ optimization utility (use at your own risk 😈)

### 🎨 Branding
- Fully custom `/etc/os-release` — the system identifies as OkakOS
- GRUB shows "OkakOS 67" instead of Arch Linux
- Custom hostname: `OkakISO` on the flash drive, customizable during installation
- Green "67" ASCII art on boot
- Green greeting "Welcome to OkakOS 67!" upon login

### 🛠️ Installer
- **OkakInstall** (Calamares) — a graphical installer with full support for:
  - Disk partitioning (auto and manual)
  - Selecting language, layout, timezone
  - User creation
  - Automatic GRUB installation
  - Post-installation setup: fish, yay, SDDM, OkakOS configs
- A fun slideshow with easter eggs during installation

### 😈 Easter Eggs
- **67WM** — the "best window manager" in the SDDM session list (DO NOT RUN)
- **Pocoyo Optimizator** — "system optimization" in the applications menu
- **Fat67** — an "exclusive file system" (mentioned in the installer)
- "67" ASCII art on every boot

## 📁 Project Structure

```
okakos/
├── airootfs/                    # Overlay files for ISO
│   ├── etc/
│   │   ├── calamares/           # Full installer configuration
│   │   │   ├── settings.conf    # Module order
│   │   │   ├── branding/okakos/ # Branding (slideshow, description)
│   │   │   └── modules/         # Configs for all modules
│   │   ├── fish/conf.d/         # Fish shell config
│   │   ├── default/grub         # GRUB config
│   │   ├── os-release           # OS identification
│   │   ├── hostname             # Hostname (OkakISO)
│   │   ├── motd                 # Greeting
│   │   ├── issue                # Login banner
│   │   ├── sddm.conf.d/        # SDDM auto-login
│   │   ├── systemd/system/      # Services
│   │   └── profile.d/           # Profile scripts
│   └── usr/
│       ├── local/bin/           # OkakOS scripts
│       │   ├── welcome          # Welcome script
│       │   ├── okakinstall      # CLI installer
│       │   ├── okakos-post-install.sh  # Post-installation
│       │   ├── pocoyo-optimizator      # 😈
│       │   └── 67wm-troll              # 😈
│       └── share/
│           ├── applications/    # .desktop files
│           ├── backgrounds/     # Wallpapers
│           ├── grub/            # GRUB background
│           └── wayland-sessions/ # 67WM session
├── packages.x86_64              # Package list for ISO
└── .github/workflows/           # CI/CD ISO build
```

## 🚀 Quick Start

### Download ready ISO
1. Go to [Releases](https://github.com/jettaxp/okakos/releases) or [Actions](https://github.com/jettaxp/okakos/actions)
2. Download the latest `OkakOS-67-*.iso`
3. Flash to a USB drive (Rufus, Ventoy, `dd`)
4. Boot up and launch **OkakInstall**

### Build ISO yourself
Requires Arch Linux or `archlinux:latest` container:

```bash
# Install dependencies
sudo pacman -S archiso base-devel git

# Clone repository
git clone https://github.com/jettaxp/okakos.git
cd okakos

# Build ISO (see workflow for details)
# Note: Requires building calamares from AUR first
```

Or just push to `main` — GitHub Actions will build the ISO automatically!

## 🔧 What happens after installation?

OkakInstall (Calamares) automatically:
1. Copies all OkakOS files to the installed system
2. Configures `/etc/os-release` → OkakOS
3. Installs GRUB with OkakOS 67 branding
4. Sets **fish** as the default shell
5. Installs **yay** for AUR
6. Enables **SDDM** and **NetworkManager**
7. Cleans up live artifacts (calamares, auto-login)

## ⚠️ Disclaimer

> **67WM** and **Pocoyo Optimizator** are joke easter eggs. Do not launch 67WM in SDDM and do not select option 1 or 3 in Pocoyo Optimizator unless you want to lose data. We warned you. 😈

## 📞 Contacts

- **Telegram**: [@jettaxp](https://t.me/jettaxp)
- **Website**: [jettax.xyz/okakos](https://jettax.xyz/okakos)
- **GitHub**: [jettaxp/okakos](https://github.com/jettaxp/okakos)

## 📜 License

Do whatever you want. It's OkakOS after all.

---

<div align="center">

**Made with 💚 by jettax**

*Six Seven approves this README.*

</div>

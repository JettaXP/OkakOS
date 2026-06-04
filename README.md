[🇷🇺 Русский](README.md) | [🇬🇧 English](README_en.md)

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

**Самый окакный дистрибутив Linux на базе Arch!**

[![Build OkakOS ISO](https://github.com/jettaxp/okakos/actions/workflows/blank.yml/badge.svg)](https://github.com/jettaxp/okakos/actions/workflows/blank.yml)

[🌐 Сайт](https://jettax.xyz/okakos) • [📦 Скачать ISO](https://github.com/jettaxp/okakos/releases) • [💬 Telegram](https://t.me/jettaxp)

</div>

---

## Что такое OkakOS?

**OkakOS 67** — это кастомный дистрибутив Linux, построенный на базе Arch Linux. Создан для тех, кто хочет получить готовую к использованию систему без необходимости настраивать всё с нуля, но при этом с юмором и пасхалками.

Число **67** (Сикс Севен) — это наш талисман, символ и философия. Оно везде: в ASCII-арте при загрузке, в названии "оконного менеджера", в слайдшоу установщика. Почему 67? Потому что можем.

## ✨ Фичи

### 🖥️ Рабочий стол
- **KDE Plasma** из коробки — полноценный, красивый и настраиваемый рабочий стол
- **SDDM** — дисплей-менеджер с автологином в live-режиме
- **Foot** — быстрый и лёгкий терминал для Wayland

### 🐟 Shell
- **Fish** — дружелюбный shell, установлен как оболочка по умолчанию
- Кастомный промпт: `user@OkakOS ~/directory ~>`
- Если введёшь несуществующую команду — получишь дружеское приветствие 🤝

### 📦 Предустановленное ПО
- **fastfetch** — показывает инфу о системе с брендингом OkakOS
- **yay** — AUR-хелпер для установки пакетов из AUR
- **Konsole** + **Dolphin** — стандартные приложения KDE
- **Pocoyo Optimizator** — ~~очень полезная~~ утилита оптимизации (используй на свой страх и риск 😈)

### 🎨 Брендинг
- Полностью кастомный `/etc/os-release` — система определяется как OkakOS
- GRUB показывает "OkakOS 67" вместо Arch Linux
- Кастомный hostname: `OkakISO` на флешке, настраиваемый при установке
- Зелёный ASCII-арт "67" при загрузке
- Зелёное приветствие "Welcome to OkakOS 67!" при входе

### 🛠️ Установщик
- **OkakInstall** (Calamares) — графический установщик с полной поддержкой:
  - Разметка дисков (авто и ручная)
  - Выбор языка, раскладки, часового пояса
  - Создание пользователя
  - Автоматическая установка GRUB
  - Пост-установочная настройка: fish, yay, SDDM, OkakOS-конфиги
- Весёлое слайдшоу с пасхалками во время установки

### 😈 Пасхалки
- **67WM** — "лучший оконный менеджер" в списке сессий SDDM (НЕ ЗАПУСКАЙ)
- **Pocoyo Optimizator** — "оптимизация системы" в меню приложений
- **Fat67** — "эксклюзивная файловая система" (упоминается в установщике)
- ASCII-арт "67" при каждой загрузке

## 📁 Структура проекта

```
okakos/
├── airootfs/                    # Overlay файлы для ISO
│   ├── etc/
│   │   ├── calamares/           # Полная конфигурация установщика
│   │   │   ├── settings.conf    # Порядок модулей
│   │   │   ├── branding/okakos/ # Брендинг (слайдшоу, описание)
│   │   │   └── modules/         # Конфиги всех модулей
│   │   ├── fish/conf.d/         # Конфиг fish shell
│   │   ├── default/grub         # Конфиг GRUB
│   │   ├── os-release           # Идентификация ОС
│   │   ├── hostname             # Имя хоста (OkakISO)
│   │   ├── motd                 # Приветствие
│   │   ├── issue                # Баннер входа
│   │   ├── sddm.conf.d/        # Автологин SDDM
│   │   ├── systemd/system/      # Сервисы
│   │   └── profile.d/           # Профильные скрипты
│   └── usr/
│       ├── local/bin/           # Скрипты OkakOS
│       │   ├── welcome          # Приветственный скрипт
│       │   ├── okakinstall      # CLI установщик
│       │   ├── okakos-post-install.sh  # Пост-установка
│       │   ├── pocoyo-optimizator      # 😈
│       │   └── 67wm-troll              # 😈
│       └── share/
│           ├── applications/    # .desktop файлы
│           ├── backgrounds/     # Обои
│           ├── grub/            # Фон GRUB
│           └── wayland-sessions/ # 67WM сессия
├── packages.x86_64              # Список пакетов для ISO
└── .github/workflows/           # CI/CD сборка ISO
```

## 🚀 Быстрый старт

### Скачать готовый ISO
1. Перейди в [Releases](https://github.com/jettaxp/okakos/releases) или [Actions](https://github.com/jettaxp/okakos/actions)
2. Скачай последний `OkakOS-67-*.iso`
3. Запиши на флешку (Rufus, Ventoy, `dd`)
4. Загрузись и запусти **OkakInstall**

### Собрать ISO самому
Требуется Arch Linux или контейнер `archlinux:latest`:

```bash
# Установи зависимости
sudo pacman -S archiso base-devel git

# Склонируй репозиторий
git clone https://github.com/jettaxp/okakos.git
cd okakos

# Собери ISO (смотри workflow для подробностей)
# Нужно сначала собрать calamares из AUR
```

Или просто пушни в `main` — GitHub Actions соберёт ISO автоматически!

## 🔧 Что происходит после установки?

OkakInstall (Calamares) автоматически:
1. Копирует все файлы OkakOS в установленную систему
2. Настраивает `/etc/os-release` → OkakOS
3. Устанавливает GRUB с брендингом OkakOS 67
4. Ставит **fish** как шелл по умолчанию
5. Устанавливает **yay** для AUR
6. Включает **SDDM** и **NetworkManager**
7. Убирает live-артефакты (calamares, автологин)

## ⚠️ Дисклеймер

> **67WM** и **Pocoyo Optimizator** — это шуточные пасхалки. Не запускай 67WM в SDDM и не выбирай пункт 1 или 3 в Pocoyo Optimizator, если не хочешь потерять данные. Мы предупредили. 😈

## 📞 Контакты

- **Telegram**: [@jettaxp](https://t.me/jettaxp)
- **Сайт**: [jettax.xyz/okakos](https://jettax.xyz/okakos)
- **GitHub**: [jettaxp/okakos](https://github.com/jettaxp/okakos)

## 📜 Лицензия

Делай что хочешь. Это же OkakOS.

---

<div align="center">

**Made with 💚 by jettax**

*Сикс Севен одобряет этот README.*

</div>

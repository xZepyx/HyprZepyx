<div align="center">


# 【 HyprZepyx Project 】


A powerful, visually stunning Hyprland configuration built for **speed, workflow efficiency, and aesthetics**.


![Last Commit](https://img.shields.io/github/last-commit/xZepyx/HyprZepyx?style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![Stars](https://img.shields.io/github/stars/xZepyx/HyprZepyx?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B)
![Repo Size](https://img.shields.io/github/repo-size/xZepyx/HyprZepyx?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)


</div>
---

## Project Overview

**HyprZepyx** is more than a configuration — in my opinion for me. Designed for **developers, and Linux enthusiasts**, it merges **aesthetic appeal** with **practical functionality**.

### Features at a Glance

- Lightning-fast workspace management
- Persistent workspaces 1–9 with dynamic app icons
- Integrated **Eww widgets** for system stats, weather, and battery
- Themeable **Waybar** with workspace-aware modules
- Customizable **Rofi launchers** for apps and wallpapers
- Advanced **pseudotiling, floating windows, and fullscreen toggles**
- Preconfigured scripts to enhance productivity

---

## Maintainer & Project Info

- **Maintainer:** xZepyx
- **Contact:** zepyxunderscore@gmail.com
- **Project Duration:** 2025–2040 (ongoing development)

### Latest Updates

- Added new **Waybar themes** with adaptive colors
- Integrated **`Alt + A` command** for automation
- Expanded **Eww widget suite** in `kernel-fault`
- Improved **workspace management scripts**
- Updated **documentation and screenshots** for clarity

---

## Screenshots & Visuals


### Kernel-Fault (ignis)

| Widgets | Launcher |
|---------|---------|
| ![Widgets](.previews/kernel-fault/widgets.png) | ![Launcher](.previews/kernel-fault/launcher.png) |
| Widgets Overview | Launcher (Ignis) |

| ControlCenter | Desktop |
|----------------|---------|
| ![img](.previews/kernel-fault/cc.png) | ![img](.previews/kernel-fault/kitty.png) |
| ControlCenter | Terminal Layout |

---

### Installation Dependencies

```bash
sudo pacman -S kitty waybar swww swaync eww rofi hyprland
```

Alternatively, use the provided script:

```bash
bash deps-installer.sh
```

**Note:** Adjust paths in scripts if you have a custom setup.

---

## Recommended Setup

- **GTK Theme:** Dark minimalist themes for best visuals
- **Fonts:** FiraCode, JetBrainsMono, or any monospaced font
- **Icons:** Papirus, Tela, or flat icon packs
- **Terminal Colors:** Solarized Dark or Gruvbox preferred

---

## Keybindings

### General Actions

| Combo           | Action                                |
|-----------------|---------------------------------------|
| Super + Enter   | Launch Kitty Terminal                  |
| Super + C       | Kill focused window                    |
| Super + M       | Exit Hyprland session                  |
| Super + E       | Open file manager (Nautilus)          |
| Super + V       | Toggle floating window                 |
| Super + D       | Open Rofi app launcher                 |
| Super + Q       | Open power menu                        |
| Super + P       | Toggle pseudotiling                    |
| Super + J       | Toggle split mode                      |
| Super + Space   | Toggle fullscreen                      |
| Super + B       | Open wallpaper switcher                |
| Super + W       | Launch Firefox                         |
| Super + F       | Launch text editor                     |
| Alt + L         | Lock screen (Hyprlock)                 |
| Alt + D         | Region screenshot (grim+slurp)        |

### Workspace Controls

| Combo                   | Action                       |
|-------------------------|-------------------------------|
| Super + [1-0]           | Switch workspace             |
| Super + Shift + [1-0]   | Move window to workspace      |
| Super + Arrow Keys       | Move focus between windows    |
| Super + Mouse Wheel      | Cycle through workspaces      |

### Mouse Controls

| Combo               | Action                  |
|--------------------|------------------------|
| Super + Left Click  | Move window             |
| Super + Right Click | Resize window           |

### Media / Volume / Brightness

| Key                       | Action           |
|---------------------------|-----------------|
| XF86AudioRaiseVolume      | Volume +5%       |
| XF86AudioLowerVolume      | Volume -5%       |
| XF86AudioMute             | Toggle mute      |
| XF86AudioMicMute          | Toggle mic mute  |
| XF86MonBrightnessUp       | Brightness +5%   |
| XF86MonBrightnessDown     | Brightness -5%   |
| XF86AudioNext             | Next Track       |
| XF86AudioPrev             | Previous Track   |
| XF86AudioPlay             | Play/Pause       |

---

## Autostarted Apps

- kitty — Terminal
- waybar — Status bar
- swww-daemon — Wallpaper manager
- swaync — Notifications
- eww — Widgets
- rofi — App and wallpaper launcher
- hyprland — Core window manager

Each app is **optimized for performance and minimal resource usage**.

---

## Installation Guide

1. Clone repository
```
git clone https://github.com/xZepyx/HyprZepyx.git ~/.config/hyprzepyx
cd ~/.config/hyprzepyx
```
2. Install dependencies
```
bash prerequisites.sh
```
3. Copy configs
```
cp -r hyprland/* ~/.config/hyprland/
```
4. Launch Hyprland
```
hyprland
```

---

## Customization & Tips

- Wallpapers: `~/.config/hyprzepyx/wallpapers/`
- Waybar colors: `~/.config/hyprzepyx/waybar/colors.css`
- Eww widgets: `~/.config/hyprzepyx/eww/`
- Keybindings: `~/.config/hyprland/hyprland.conf`

Tips:
- Use pseudotiling for improved window management
- Assign workspace-specific apps
- Combine Rofi + Eww for a seamless aesthetic workflow

---

## Troubleshooting

- Waybar icons missing: Install FontAwesome or Material Icons
- Eww widgets missing: Run `eww daemon` before Hyprland
- Rofi launcher errors: Check `rofi/config.rasi` paths
- Hyprland crashes: Check `~/.local/share/hyprland.log`

---

## Old Stuff

### Spectral-Horizon (quickshell)

| Widgets | Launcher |
|---------|---------|
| ![Widgets](.previews/spectral-horizon/widgets.png) | ![Launcher](.previews/spectral-horizon/launcher.png) |
| Widgets Overview | Launcher (Ignis) |

| Wallpaper Menu | Desktop |
|----------------|---------|
| ![wall](.previews/spectral-horizon/wall.png) | ![desktop](.previews/spectral-horizon/desktop.png) |
| Wallpaper Menu | Desktop |

### Abyss (eww)

| Code Editor | Lockscreen |
|------------|------------|
| ![Code](.previews/Abyss/Code.png) | ![Hyprlock](.previews/Abyss/hyprlock.png) |
| VSCode Layout | Minimal Lock |

| Wallpaper Switcher | Eww Minimal |
|------------------|-------------|
| ![Rofi Wall](.previews/Abyss/rofi-wayland-wall.png) | ![Eww Minimal](.previews/Abyss/eww-minimal.png) |
| Rofi Wallpaper Manager | Minimal Widget Set |

### Lumen (glossy)

| Desktop | Lockscreen |
|---------|------------|
| ![Desktop](.previews/Lumen/desktop.png) | ![Hyprlock](.previews/Lumen/hyprlock.png) |
| Idle Desktop | Hyprlock |

| Rofi Apps | Terminal |
|-----------|---------|
| ![Rofi Apps](.previews/Lumen/rofi-op.png) | ![Terminal](.previews/Lumen/Terminal.png) |
| App Launcher | Terminal Layout |


---

## Acknowledgments

- [Hyprland](https://github.com/hyprwm/hyprland)
- [Ignis Project](https://github.com/ignis-sh/ignis)
- [Rofi](https://github.com/davatorium/rofi)
- [Eww](https://elkowar.github.io/eww/)
- [Waybar Project](https://github.com/Alexays/Waybar)

---

## License

© 2025–2040 Aditya Yadav (zepyxunderscore@gmail.com)
Licensed under **GNU GPLv3** — free to use, modify, and redistribute.

---

## FAQ

**Q:** Can I use this on Sway?
**A:** Hyprland-specific, but some widgets may be adapted.

**Q:** How to update HyprZepyx?
**A:** Pull latest repo and reapply configs.

**Q:** Can I contribute?
**A:** Yes, fork, edit, and submit a pull request.

---

## Additional Screenshots

| Minimal Widgets | Dark Launcher |
|----------------|---------------|
| ![Minimal](.previews/extra/minimal.png) | ![Dark](.previews/extra/dark-launcher.png) |

| Full Layout | Workspace Icons |
|------------|----------------|
| ![Full](.previews/extra/full-layout.png) | ![Icons](.previews/extra/workspace-icons.png) |


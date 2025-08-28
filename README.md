<div align="center">
  <h1>【 HyprZepyx Project 】</h1>
</div>

<div align="center">
  
![Last Commit](https://img.shields.io/github/last-commit/xZepyx/HyprZepyx?&style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![Stars](https://img.shields.io/github/stars/xZepyx/HyprZepyx?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B)
![Repo Size](https://img.shields.io/github/repo-size/xZepyx/HyprZepyx?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)

</div>

---

<div align="center">
  <h2>• Overview •</h2>
</div>

A **minimal yet functional** Hyprland configuration focused on speed, clarity, and aesthetics.  
Designed and maintained by **xZepyx**.  

> ⚡ **Note:** This setup is tailored for personal use. Some paths or scripts may require adjustments.  
> 📦 To use the **kernel-fault** theme, install the required packages listed in [`requirements-ignis.txt`](config/kernel-fault/ignis/requirments-ignis.txt).  
> 🎨 For best visuals, ensure proper GTK themes and fonts are installed.  

---

<details>
  <summary><b>Keybindings</b></summary>

| Combo           | Action                                |
|-----------------|---------------------------------------|
| `Super + Enter` | Launch Kitty Terminal                 |
| `Super + C`     | Kill focused window                   |
| `Super + M`     | Exit Hyprland session                 |
| `Super + E`     | Open file manager (Nautilus)          |
| `Super + V`     | Toggle floating window                |
| `Super + D`     | Open Rofi app launcher                |
| `Super + Q`     | Open power menu                       |
| `Super + P`     | Toggle pseudotiling                   |
| `Super + J`     | Toggle split mode                     |
| `Super + Space` | Toggle fullscreen                     |
| `Super + B`     | Open wallpaper switcher               |
| `Super + W`     | Launch Firefox                        |
| `Super + F`     | Launch text editor                    |
| `Alt + L`       | Lock screen (Hyprlock)                |
| `Alt + D`       | Region screenshot (grim+slurp)        |

**Workspace controls:**  
- `Super + [1-0]` → Switch workspaces  
- `Super + Shift + [1-0]` → Move window to workspace  
- `Super + Arrow Keys` → Move focus  
- `Super + Mouse Wheel` → Cycle workspaces  

**Mouse binds:**  
- `Super + Left Click` → Move window  
- `Super + Right Click` → Resize window  

**Media / Volume / Brightness:**  
- `XF86AudioRaiseVolume` → Volume +5%  
- `XF86AudioLowerVolume` → Volume -5%  
- `XF86AudioMute` → Toggle mute  
- `XF86AudioMicMute` → Toggle mic mute  
- `XF86MonBrightnessUp/Down` → Brightness ±5%  
- `XF86AudioNext/Prev/Play/Pause` → Media control  

</details>

<details>
  <summary><b>Autostarted Apps</b></summary>

- `kitty` — Terminal  
- `waybar` — Status bar  
- `swww-daemon` — Wallpaper  
- `swaync` — Notifications  
- `eww` — Widgets  

</details>

---

<div align="center">
  <h2>• Screenshots •</h2>
</div>

### kernel-fault<sup>ignis</sup> — *“fatal exception: elegance”*  (a.k.a **Ignis Fault**)

Widget system: **Ignis** | Support: Yes

| Widgets | Launcher |
|:-------:|:--------:|
| ![Widgets](.previews/kernel-fault/widgets.png) | ![Launcher](.previews/kernel-fault/launcher.png) |
| *Widgets* | *Launcher (Ignis)* |

| Control Center | Terminal |
|:--------------:|:--------:|
| ![Control Center](.previews/kernel-fault/control-center.png) | ![Terminal](.previews/kernel-fault/kitty.png) |
| *Control Center* | *Terminal* |

---

### abyss<sup>eww</sup> — *“stillness devours”*  

Widget system: **eww** | Support: Yes

| Code | Lockscreen |
|:----:|:----------:|
| ![Code](.previews/Abyss/Code.png) | ![Hyprlock](.previews/Abyss/hyprlock.png) |
| *Code* | *Hyprlock* |

| Wallpaper Switcher | Eww Minimal |
|:-----------------:|:-----------:|
| ![Rofi Wall](.previews/Abyss/rofi-wayland-wall.png) | ![Eww Minimal](.previews/Abyss/eww-minimal.png) |
| *Rofi (Wall)* | *Eww Minimal* |

---

### lumen<sup>glossy</sup> — *“shadows made visible.”*  

Widget system: **None** | Support: No (Dead)  

| Desktop | Lockscreen |
|:-------:|:----------:|
| ![Desktop](.previews/Lumen/desktop.png) | ![Hyprlock](.previews/Lumen/hyprlock.png) |
| *Idle Desktop* | *Hyprlock* |

| Rofi Apps | Terminal |
|:---------:|:--------:|
| ![Rofi Apps](.previews/Lumen/rofi-op.png) | ![Terminal](.previews/Lumen/Terminal.png) |
| *App Launcher* | *Terminal Layout* |

---

<div align="center">
  <h2>• Acknowledgments •</h2>
</div>

- [Hyprland](https://github.com/hyprwm/hyprland)
- [Ignis Project](https://github.com/ignis-sh/ignis)
- [Rofi](https://github.com/davatorium/rofi)
- [Eww](https://elkowar.github.io/eww/)  
- [Waybar Project](https://github.com/Alexays/Waybar)  

---

<div align="center">
  <h2>• License •</h2>
</div>

© 2025–2040 Aditya Yadav <zepyxunderscore@gmail.com>  
Licensed under **GNU GPLv3** — free to use, modify, and redistribute.  

---

<div align="center">
  <h2>• Final note •</h2>
</div>

This configuration is all about **clean visuals** and **fast workflows**.  
Tweak it, remix it, or use it as a base for your own setup.  
✨ Happy customizing! ✨


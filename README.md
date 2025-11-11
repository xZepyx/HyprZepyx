
<div align="center">

#  HyprZepyx Project 

A robust, high-performance Hyprland configuration, focused on workflow efficiency, customization, and a refined visual experience for developers and advanced Linux users.

<p>
  <img src="https://img.shields.io/github/last-commit/xZepyx/HyprZepyx?style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B" alt="Last Commit" />
  &nbsp;
  <img src="https://img.shields.io/github/stars/xZepyx/HyprZepyx?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B" alt="Stars" />
  &nbsp;
  <img src="https://img.shields.io/github/repo-size/xZepyx/HyprZepyx?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B" alt="Repo Size" />
  &nbsp;
  <img src="https://img.shields.io/badge/Maintenance-Actively%20Maintained-6BCB77?style=for-the-badge&logo=vercel&logoColor=D9E0EE&labelColor=1E202B" alt="Maintenance" />
</p>

[Website](https://hyprzepyx.info.gf)

</div>

---

## Overview

**HyprZepyx** delivers a modular, modern Hyprland setup, designed for users prioritizing speed, system clarity, and clean screens. The repository is frequently updated and structured for maintainability and ease of adjustment, supporting multiple color schemes and minimal distractions.

---

## Features

- Comprehensive Hyprland configuration for advanced users
- Multiple curated visual themes and color schemes
- Adaptive and theme-specific Waybar integration
- Clearly organized configs and modular scripts
- Minimal system overhead, suitable for performance-oriented setups
- Regular updates reflecting current Hyprland standards

---

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/xZepyx/HyprZepyx.git ~/hyprzepyx
    cd ~/hyprzepyx
    ```
2. Install dependencies:
    ```bash
    bash deps-installer.sh
    ```
3. Copy configuration files as required.
4. Launch Hyprland:
    ```bash
    hyprland
    ```

Additional setup guidance can be found in docs or script comments.

---

## Recommended Environment

- **GTK Theme:** Dark, minimalist (for optimal visual consistency)
- **Fonts:** FiraCode, JetBrainsMono, or comparable monospaced fonts
- **Icons:** Papirus, Tela, or similar icon sets
- **Terminal Colors:** Solarized Dark, Gruvbox

---

## Screenshots

### Quiet-Fracture

| Desktop                                          | Launcher                                           |
| ------------------------------------------------ | -------------------------------------------------- |
| ![Widgets](.previews/quiet-fracture/desktop.png) | ![Launcher](.previews/quiet-fracture/launcher.png) |

### Kernel-Fault<sup>ignis</sup>

| Widgets                                        | Launcher                                         |
| ---------------------------------------------- | ------------------------------------------------ |
| ![Widgets](.previews/kernel-fault/widgets.png) | ![Launcher](.previews/kernel-fault/launcher.png) |

Additional previews and themes are available under `.previews/`.

---

## Troubleshooting

- **Waybar icons missing:** Install FontAwesome or Material Icons.
- **Eww widgets don’t appear:** Ensure `eww daemon` is running before launching Hyprland.
- **Rofi launcher errors:** Verify path correctness in `rofi/config.rasi`.
- **Hyprland crash:** Review logs in `~/.local/share/hyprland.log` for diagnostics.

---

## Roadmap

- Transition from Wofi to Walker
- Enhanced wallpaper switcher
- Unified installation script
- Modular dependency management per theme

---

## Maintainer

- **Primary Contact:** xZepyx  
- **Email:** [zepyxunderscore@gmail.com](mailto:zepyxunderscore@gmail.com)

---

## Acknowledgments

- [Hyprland](https://github.com/hyprwm/hyprland)
- [Quickshell](https://github.com/quickshell-mirror/quickshell)
- [Ignis Project](https://github.com/ignis-sh/ignis)
- [Rofi](https://github.com/davatorium/rofi)
- [Eww](https://elkowar.github.io/eww/)
- [Waybar](https://github.com/Alexays/Waybar)

_The Spectral-Horizon theme is forked from end4 dotfiles, with modifications for privacy and performance._

---

## License

© 2025–2040 xZepyx (Aditya Yadav)  
Licensed under GNU GPLv3.

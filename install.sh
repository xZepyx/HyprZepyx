#!/usr/bin/env bash
# HyprZepyx Dotfiles Installer
# Fancy, safe, interactive installer

set -euo pipefail

# ───────────────────────────────
# Colors
# ───────────────────────────────
GREEN="\e[92m"
RED="\e[91m"
YELLOW="\e[93m"
CYAN="\e[96m"
BOLD="\e[1m"
RESET="\e[0m"

# ───────────────────────────────
# Banner
# ───────────────────────────────
clear
if command -v toilet >/dev/null 2>&1; then
  if command -v lolcat >/dev/null 2>&1; then
    toilet -f mono9 "HyprZepyx" | lolcat
  else
    toilet -f mono9 "HyprZepyx"
  fi
else
  echo -e "${YELLOW}[!] 'toilet' is not installed.${RESET}"
  echo -e "    It’s only for pretty ASCII banners, not required."
  echo -e "    You can install it later with:"
  echo -e "    ${CYAN}pacman -S toilet${RESET} (Arch)"
  echo -e "    ${CYAN}apt install toilet${RESET} (Debian/Ubuntu)"
  echo -e "    ${CYAN}dnf install toilet${RESET} (Fedora)"
  echo
  echo -e "${BOLD}HyprZepyx Installer${RESET}"
fi
echo

# ───────────────────────────────
# Confirm
# ───────────────────────────────
read -rp "$(echo -e ${YELLOW}"Proceed with installing HyprZepyx dotfiles? (y/N): "${RESET})" ans
[[ ! "${ans:-}" =~ ^[Yy]$ ]] && echo -e "${RED}[-] Cancelled.${RESET}" && exit 1

# ───────────────────────────────
# Detect package manager
# ───────────────────────────────
detect_pkg_mgr() {
  command -v pacman >/dev/null && echo "pacman" && return
  command -v apt >/dev/null && echo "apt" && return
  command -v dnf >/dev/null && echo "dnf" && return
}
PKG=$(detect_pkg_mgr || true)

# ───────────────────────────────
# Dependencies
# ───────────────────────────────
ARCH_PKGS=(hyprland waybar rofi dunst foot grim slurp wl-clipboard brightnessctl polkit-kde-agent xdg-desktop-portal-hyprland swww jq kitty mpv firefox)
APT_PKGS=(waybar rofi dunst foot grim slurp wl-clipboard brightnessctl polkit-kde-agent-1 pipewire wireplumber xdg-desktop-portal-hyprland swww jq fonts-hack-ttf kitty mpv firefox-esr)
DNF_PKGS=(waybar rofi dunst foot grim slurp wl-clipboard brightnessctl polkit-gnome pipewire wireplumber xdg-desktop-portal-hyprland swww jq hack-fonts kitty mpv firefox)

if [ -n "$PKG" ]; then
  echo -e "${CYAN}[+] Installing dependencies with $PKG...${RESET}"
  case $PKG in
    pacman) sudo pacman -S --needed "${ARCH_PKGS[@]}" ;;
    apt) sudo apt update && sudo apt install -y "${APT_PKGS[@]}" || echo -e "${YELLOW}[!] Hyprland may need manual install on Debian/Ubuntu${RESET}" ;;
    dnf) sudo dnf install -y "${DNF_PKGS[@]}" ;;
  esac
else
  echo -e "${RED}[!] Could not detect package manager. Install these manually:${RESET}"
  echo "    hyprland waybar rofi dunst foot grim slurp wl-clipboard brightnessctl polkit pipewire wireplumber xdg-desktop-portal-hyprland swww jq hack-fonts kitty mpv firefox"
fi

# ───────────────────────────────
# Clone or update repo
# ───────────────────────────────
REPO="https://github.com/xZepyx/HyprZepyx.git"
DIR="$HOME/.hyprzepyx-dotfiles"
if [ -d "$DIR/.git" ]; then
  echo -e "${YELLOW}[!] Dotfiles already exist. Updating...${RESET}"
  git -C "$DIR" fetch --all
  git -C "$DIR" reset --hard origin/main
else
  echo -e "${CYAN}[+] Cloning HyprZepyx dotfiles...${RESET}"
  git clone "$REPO" "$DIR"
fi

# ───────────────────────────────
# Backup & Theme selector
# ───────────────────────────────
echo
PS3="Select theme [default: Lumen]: "
select theme in "Lumen" "Abyss"; do
  theme=${theme:-Lumen}
  case $theme in
    "Lumen"|"Abyss")
      BACKUP_DIR="$HOME/.config-backup-$(date +%s)"
      echo -e "${CYAN}[+] Backing up ~/.config → $BACKUP_DIR ${RESET}"
      mkdir -p "$BACKUP_DIR"
      cp -r "$HOME/.config/"* "$BACKUP_DIR/" 2>>"$HOME/hyprzepyx-install.log" || true

      # Install configs (copy CONTENTS, not the folder itself)
      echo -e "${CYAN}[+] Installing $theme configs...${RESET}"
      shopt -s dotglob nullglob
      cp -r "$DIR/config/$theme/"* "$HOME/.config/"
      shopt -u dotglob nullglob

      # Install scripts (preserve Abyss & Lumen structure)
      echo -e "${CYAN}[+] Installing scripts to ~/.scripts...${RESET}"
      mkdir -p "$HOME/.scripts"
      cp -r "$DIR/scripts/"* "$HOME/.scripts/"

      echo -e "${GREEN}[✔] $theme theme installed.${RESET}"
      break
      ;;
    *) echo -e "${RED}Invalid choice, try again.${RESET}" ;;
  esac
done

# ───────────────────────────────
# Finish
# ───────────────────────────────
echo
echo -e "${GREEN}[✔] HyprZepyx installation complete!${RESET}"
echo -e "${CYAN}→ Restart Hyprland to apply changes.${RESET}"
echo -e "${CYAN}→ Backup stored at: $BACKUP_DIR${RESET}"
echo -e "${CYAN}→ Install log: $HOME/hyprzepyx-install.log${RESET}"


#!/usr/bin/env bash

# ----------------------------------------------------------
# Dependencies for HyprZepyx
# ----------------------------------------------------------

packages=(
    "wget"
    "unzip"
    "git"
    "gum"    
    "hyprland"
    "wf-recorder"
    "waybar"
    "grim"
    "slurp"
    "swww"
    "wofi"
    "nvim"
    "nwg-dock-hyprland"
    "nautilus"
    "dolphin"
    "chromium"
    "quickshell"
    "ignis-git"
    "nerd-fonts"
    "rofi-wayland"
    "kitty"
    "dunst"
    "thunar"
    "xdg-desktop-portal-hyprland"
    "qt5-wayland"
    "qt6-wayland"
    "hyprpaper"
    "hyprlock"
    "firefox"
    "ttf-font-awesome"
    "vim"
    "fastfetch"
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd"
    "jq"
    "brightnessctl"
    "networkmanager"
    "wireplumber"
    "wlogout"
    "flatpak"
)

# ----------------------------------------------------------
# Colors
# ----------------------------------------------------------

GREEN='\033[0;32m'
NONE='\033[0m'

# ----------------------------------------------------------
# Check if command exists
# ----------------------------------------------------------

_checkCommandExists() {
    command -v "$1" >/dev/null 2>&1
}

# ----------------------------------------------------------
# Check if package is already installed
# ----------------------------------------------------------

_isInstalled() {
    pacman -Qs "$1" >/dev/null 2>&1
}

# ----------------------------------------------------------
# Install yay (AUR helper) if needed
# ----------------------------------------------------------

_installYay() {
    echo ":: Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel git
    tmp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmp_dir/yay"
    pushd "$tmp_dir/yay" || exit
    makepkg -si --noconfirm
    popd || exit
    rm -rf "$tmp_dir"
    echo ":: yay installed successfully."
}

# ----------------------------------------------------------
# Install packages
# ----------------------------------------------------------

_installPackages() {
    for pkg in "$@"; do
        if _isInstalled "$pkg"; then
            echo ":: ${pkg} is already installed."
        else
            echo ":: Installing ${pkg}..."
            yay --noconfirm -S "$pkg"
        fi
    done
}

# ----------------------------------------------------------
# Header
# ----------------------------------------------------------

clear
echo -e "${GREEN}"
cat <<"EOF"
   ____    __          
  / __/__ / /___ _____ 
 _\ \/ -_) __/ // / _ \
/___/\__/\__/\_,_/ .__/
                /_/    
HyprZepyx Dependency Installer for Arch-based distros
EOF
echo -e "${NONE}"

# ----------------------------------------------------------
# Confirm start
# ----------------------------------------------------------

read -p "Do you want to start installing dependencies? (Y/n): " yn
if [[ ! $yn =~ ^[Yy]$ ]]; then
    echo ":: Installation canceled."
    exit 0
fi

# ----------------------------------------------------------
# Install yay if needed
# ----------------------------------------------------------

if _checkCommandExists "yay"; then
    echo ":: yay is already installed."
else
    _installYay
fi

# ----------------------------------------------------------
# Install all dependencies
# ----------------------------------------------------------

_installPackages "${packages[@]}"

# ----------------------------------------------------------
# Completed
# ----------------------------------------------------------

echo ":: All dependencies installed successfully."
echo ":: You can now clone and use the HyprZepyx project without touching configs."


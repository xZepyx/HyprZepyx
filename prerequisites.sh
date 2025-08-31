#!/bin/bash
#
# HyprZepyx Universal Prerequisites Installer
#

set -e

echo "Select Theme:"
echo "[1] kernel-fault"
echo "[2] abyss"
echo "[3] lumen"

read -p "Enter choice [1-3]: " choice

# Detect package manager
if command -v pacman >/dev/null 2>&1; then
    PM="sudo pacman -S --needed --noconfirm"
elif command -v apt >/dev/null 2>&1; then
    PM="sudo apt install -y"
    sudo apt update
elif command -v dnf >/dev/null 2>&1; then
    PM="sudo dnf install -y"
elif command -v zypper >/dev/null 2>&1; then
    PM="sudo zypper install -y"
else
    echo "Unsupported distro: no pacman/apt/dnf/zypper found."
    exit 1
fi

# Core Hyprland deps (no wofi, use rofi-wayland)
COMMON_DEPS=(
    hyprland
    waybar
    rofi
    kitty
    thunar
    polkit-gnome
    nwg-look
    lxappearance
    grim
    slurp
    swappy
    wf-recorder
    cliphist
    brightnessctl
    pavucontrol
    pamixer
    playerctl
    network-manager-applet
    xdg-desktop-portal-hyprland
    xdg-user-dirs
    xdg-utils
    qt5-wayland
    qt6-wayland
    gvfs
    imagemagick
    wl-clipboard
    gammastep
    pipewire
    wireplumber
    pipewire-pulse
    pipewire-alsa
    pipewire-jack
    swww
)

# Extra deps for kernel-fault
KERNEL_EXTRA=(
    python3
)

install_packages() {
    echo "[+] Installing: $*"
    $PM "$@"
}

setup_kernel_fault_venv() {
    echo "[+] Setting up Python venv for kernel-fault..."

    VENV_DIR="$HOME/.config/ignis/ignis-python-venv"
    mkdir -p "$HOME/.config/ignis"

    python3 -m venv "$VENV_DIR"
    source "$VENV_DIR/bin/activate"

    pip install --upgrade pip
    pip install \
        git+https://github.com/ignis-sh/ignis.git \
        jinja2 \
        Pillow \
        materialyoucolor

    deactivate
    echo "[✔] Ignis Python venv setup complete"
}

case "$choice" in
    1)
        echo "[+] Installing dependencies for kernel-fault..."
        install_packages "${COMMON_DEPS[@]}" "${KERNEL_EXTRA[@]}"
        setup_kernel_fault_venv
        ;;
    2)
        echo "[+] Installing dependencies for abyss..."
        install_packages "${COMMON_DEPS[@]}"
        ;;
    3)
        echo "[+] Installing dependencies for lumen..."
        install_packages "${COMMON_DEPS[@]}"
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac

echo "[✔] Installation complete."


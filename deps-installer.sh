#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
export base="$(pwd)"

# Load helpers if you have any, otherwise remove these lines
source ./scriptdata/environment-variables
source ./scriptdata/functions
source ./scriptdata/installers
source ./scriptdata/options

# Ensure Arch-based system
if ! command -v pacman >/dev/null 2>&1; then
  printf "\e[31m[$0]: pacman not found, system not Arch-based. Aborting...\e[0m\n"
  exit 1
fi

# Prevent running as root
prevent_sudo_or_root

# Ask before executing commands
ask=true
printf "Do you want to confirm every time before a command executes? [y/N]: "
read -r p
case $p in
  n|N) ask=false ;;
  *) ask=true ;;
esac

printf "\e[36m[$0]: 1. Update system and install base packages\e[0m\n"

# System update
case $SKIP_SYSUPDATE in
  true) sleep 0;;
  *) $ask && sudo pacman -Syu || sudo pacman -Syu --noconfirm ;;
esac

# Read package list (you can define DEPLISTFILE with required packages)
remove_bashcomments_emptylines "${DEPLISTFILE}" ./cache/dependencies_stripped.conf
readarray -t pkglist < ./cache/dependencies_stripped.conf

# Ensure yay is installed
if ! command -v yay >/dev/null 2>&1; then
  echo -e "\e[33m[$0]: \"yay\" not found. Installing...\e[0m"
  showfun install-yay
  v install-yay
fi

# Install packages from list
if (( ${#pkglist[@]} != 0 )); then
  if $ask; then
    for i in "${pkglist[@]}"; do
      v yay -S --needed "$i"
    done
  else
    v yay -S --needed --noconfirm "${pkglist[*]}"
  fi
fi

# Handle deprecated dependencies if any
showfun handle-deprecated-dependencies
v handle-deprecated-dependencies

# Install Python packages
showfun install-python-packages
v install-python-packages

# Optional: Add user to required groups
v sudo usermod -aG video,i2c,input "$(whoami)"
v bash -c "echo i2c-dev | sudo tee /etc/modules-load.d/i2c-dev.conf"
v sudo systemctl enable bluetooth --now

printf "\n\e[36m[$0]: Dependency installation complete!\e[0m\n"


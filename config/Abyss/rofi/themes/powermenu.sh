#!/usr/bin/env bash

# Define options
options=" Lock\n⏾ Suspend\n Reboot\n Shutdown\n󰍃 Logout"

# Rofi command
choice=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -theme ~/.config/rofi/themes/powermenu-config.rasi)

case "$choice" in
  " Lock")        
    if command -v swaylock >/dev/null 2>&1; then
      swaylock
    elif command -v betterlockscreen >/dev/null 2>&1; then
      betterlockscreen -l
    else
      hyprlock
    fi
    ;;

  "⏾ Suspend")
    systemctl suspend
    ;;

  " Reboot")
    systemctl reboot
    ;;

  " Shutdown")
    systemctl poweroff
    ;;

  "󰍃 Logout")
    hyprctl dispatch exit
    ;;
esac


#!/bin/bash

THEME_DIR="$HOME/.config/waybar/themes"
ASSET_DIR="$HOME/.config/waybar/assets"

# List themes
THEMES=$(ls -1 "$THEME_DIR")

# Build menu input with icons (icon path + theme name)
MENU=""
for t in $THEMES; do
    ICON="$ASSET_DIR/$t.png"
    if [[ -f "$ICON" ]]; then
        MENU+="$t\0icon\x1f$ICON\n"
    else
        MENU+="$t\n"
    fi
done

# Show menu with icons
THEME=$(echo -en "$MENU" | rofi -dmenu -markup-rows -p "Waybar Theme:")

# Exit if no choice
[ -z "$THEME" ] && exit 0

# Validate
if [[ ! -d "$THEME_DIR/$THEME" ]]; then
    notify-send "Waybar Theme" "Theme '$THEME' not found"
    exit 1
fi

# Kill and launch Waybar with selected theme
pkill waybar
waybar --config "$THEME_DIR/$THEME/config.jsonc" --style "$THEME_DIR/$THEME/style.css" &

notify-send "Waybar Theme" "Switched to $THEME"


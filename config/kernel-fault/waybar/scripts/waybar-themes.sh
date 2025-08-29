#!/bin/bash

THEME_DIR="$HOME/.config/waybar/themes"
WAYBAR_DIR="$HOME/.config/waybar"

# List themes (folders inside $THEME_DIR)
THEMES=$(ls -1 "$THEME_DIR")

# Show menu (choose wofi or rofi)
THEME=$(echo "$THEMES" | rofi -dmenu -p "Waybar Theme:")  # replace wofi with rofi -dmenu if you prefer

# Exit if no choice
[ -z "$THEME" ] && exit 0

# Validate
if [[ ! -d "$THEME_DIR/$THEME" ]]; then
    notify-send "Waybar Theme" "Theme '$THEME' not found"
    exit 1
fi

# Apply theme (symlink files)
ln -sf "$THEME_DIR/$THEME/colors.css" "$WAYBAR_DIR/colors.css"
ln -sf "$THEME_DIR/$THEME/style.css" "$WAYBAR_DIR/style.css"
ln -sf "$THEME_DIR/$THEME/config.jsonc" "$WAYBAR_DIR/config.jsonc"

# Restart waybar
pkill waybar && waybar &

notify-send "Waybar Theme" "Switched to $THEME"


#!/usr/bin/env bash

WALLDIR="$HOME/Pictures/Wallpapers"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$WALLDIR"

# Get random wallpaper from Picsum (1920x1080)
URL="https://picsum.photos/1920/1080"

# Save with timestamp
FILE="$WALLDIR/picsum_$(date +%s).jpg"

curl -s -L "$URL" -o "$FILE"

# Switch wallpaper
"$SCRIPT_DIR/switchwall.sh" --image "$FILE"

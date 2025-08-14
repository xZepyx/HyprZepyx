#!/usr/bin/env bash

WALL_DIR="$HOME/Wallpapers/Abyss"
THUMB_DIR="$HOME/.cache/wallthumbs"
mkdir -p "$THUMB_DIR"

find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | while read -r img; do
    hash="$(sha1sum <<< "$img" | awk '{print $1}')"
    thumb="$THUMB_DIR/$hash.jpg"
    [ -f "$thumb" ] || magick "$img" -resize 256x144^ -gravity center -extent 256x144 -quality 90 "$thumb"
done


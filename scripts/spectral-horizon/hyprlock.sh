#!/usr/bin/env bash

# Update hyprlock.conf wallpaper
wallpath=$(swww query | grep -oP 'image: \K.*')
sed -i "s|^ *path = .*|    path = $wallpath|" ~/.config/hypr/hyprlock.conf

sleep 0.1 && hyprlock

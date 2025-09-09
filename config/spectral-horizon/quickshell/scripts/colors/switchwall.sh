#!/usr/bin/env bash

# Initialize swww if not already running
pgrep -x swww-daemon >/dev/null || swww init

imgpath=""

# Parse args from QML
while [[ $# -gt 0 ]]; do
    case "$1" in
        --image)
            imgpath="$2"
            shift 2
            ;;
        --mode) # QML still passes this, just ignore
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

# Exit if no image
if [[ -z "$imgpath" ]] || [[ ! -f "$imgpath" ]]; then
    echo "No valid image file given"
    exit 1
fi

# Apply wallpaper with smooth transition (no upscale)
swww img "$imgpath" \
    --transition-type any \
    --transition-fps 60 \
    --transition-step 255 \
    --transition-duration 1

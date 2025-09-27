#!/usr/bin/env bash

main_menu() {
    options=(
      "󰀻  Apps"
      "󰄀  Capture"
      "󰏘  Style"
      "󰏖  Install"
      "󰆴  Remove"
      "󰚰  Update"
      "󰋼  About"
      "󰐥  System"
    )

    choice=$(printf '%s\n' "${options[@]}" | wofi --show dmenu --prompt "HyprZepyx Menu" --width 400 --height 460 \
        --define=history=0 --define=sorting=alphabetical --allow-images --insensitive --no-actions)

    case "$choice" in
        "󰀻  Apps") apps_menu ;;
        "󰄀  Capture") capture_menu ;;
        "󰏘  Style") style_menu ;;
        "󰏖  Install") install_menu ;;
        "󰆴  Remove") remove_menu ;;
        "󰚰  Update") update_menu ;;
        "󰋼  About") about_menu ;;
        "󰐥  System") system_menu ;;
    esac
}

apps_menu() {
    wofi --show drun --prompt "Run App" \
        --define=history=0 --define=sorting=alphabetical --allow-images --insensitive --no-actions
    main_menu
}

capture_menu() {
    opts=("  Screenshot" "󰑊  Screen Record" "󰜮  Back")
    choice=$(printf '%s\n' "${opts[@]}" | wofi --show dmenu --prompt "Capture" \
        --define=history=0 --define=sorting=alphabetical --allow-images --insensitive --no-actions)
    case "$choice" in
        "  Screenshot") grim -g "$(slurp)" ~/Pictures/screenshot.png ;;
        "󰑊  Screen Record") wf-recorder -f ~/Videos/recording.mp4 ;;
        "󰜮  Back") main_menu ;;
    esac
}

style_menu() {
    opts=("󰔎  Nord" "󰘧  Gruvbox" "󰇼  Dracula" "󰔡  Everforest" "󰑢  Catppuccin Latte" "󰀦  Adwaita Dark" "󰜮  Shadow" "󰜮  Back")
    choice=$(printf '%s\n' "${opts[@]}" | wofi --show dmenu --prompt "Style" \
        --define=history=0 --define=sorting=alphabetical --allow-images --insensitive --no-actions)
    
    case "$choice" in
        "󰔎  Nord") matugen image "$(find ~/.config/hyprzepyx/themes/Nord/ -type f | shuf -n 1)" ;;
        "󰘧  Gruvbox") matugen image "$(find ~/.config/hyprzepyx/themes/Gruvbox/ -type f | shuf -n 1)" ;;
        "󰇼  Dracula") matugen image "$(find ~/.config/hyprzepyx/themes/Dracula/ -type f | shuf -n 1)" ;;
        "󰔡  Everforest") matugen image "$(find ~/.config/hyprzepyx/themes/Everforest/ -type f | shuf -n 1)" ;;
        "󰑢  Catppuccin Latte") matugen image "$(find ~/.config/hyprzepyx/themes/Catppuccin-Latte/ -type f | shuf -n 1)" ;;
        "󰀦  Adwaita Dark") matugen image "$(find ~/.config/hyprzepyx/themes/Adwaita-Dark/ -type f | shuf -n 1)" ;;
        "󰜮  Shadow") matugen image "$(find ~/.config/hyprzepyx/themes/Shadow/ -type f | shuf -n 1)" ;;
        "󰜮  Back") main_menu ;;
    esac
}


install_menu() {
    # List all available packages from pacman
    pkgs=$(pacman -Slq)
    choice=$(echo "$pkgs" | wofi --show dmenu --prompt "Install Package" \
        --define=history=0 --define=sorting=alphabetical --insensitive --no-actions)
    
    if [[ -n "$choice" ]]; then
        kitty -e bash -c "sudo pacman -S $choice; echo 'Press Enter to close...'; read"
    fi
    main_menu
}

remove_menu() {
    # List all installed packages
    pkgs=$(pacman -Qq)
    choice=$(echo "$pkgs" | wofi --show dmenu --prompt "Remove Package" \
        --define=history=0 --define=sorting=alphabetical --insensitive --no-actions)
    
    if [[ -n "$choice" ]]; then
        kitty -e bash -c "sudo pacman -R $choice; echo 'Press Enter to close...'; read"
    fi
    main_menu
}


update_menu() {
    kitty -e sudo pacman -Syu
}

about_menu() {
    notify-send "󰋼  System Info" "$(lsb_release -d | cut -f2)\nKernel: $(uname -r) | Running HyprZepyx"
}

system_menu() {
    opts=("  Lock" "󰍃  Logout" "󰜉  Reboot" "  Shutdown" "󰤄  Suspend" "󰜮  Back")
    choice=$(printf '%s\n' "${opts[@]}" | wofi --show dmenu --prompt "System" \
        --define=history=0 --define=sorting=alphabetical --allow-images --insensitive --no-actions)
    case "$choice" in
        "  Lock") hyprlock || swaylock ;;
        "󰍃  Logout") hyprctl dispatch exit 0 ;;
        "󰜉  Reboot") systemctl reboot ;;
        "  Shutdown") systemctl poweroff ;;
        "󰤄  Suspend") systemctl suspend ;;
        "󰜮  Back") main_menu ;;
    esac
}

main_menu


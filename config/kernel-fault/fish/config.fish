if status is-interactive
    toilet -f mono9 "Hyprland"
end
source (/usr/bin/starship init fish --print-full-init | psub)

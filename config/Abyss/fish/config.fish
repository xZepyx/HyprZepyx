if status is-interactive
     set -g fish_greeting
    # Commands to run in interactive sessions can go here
end
source (/usr/bin/starship init fish --print-full-init | psub)

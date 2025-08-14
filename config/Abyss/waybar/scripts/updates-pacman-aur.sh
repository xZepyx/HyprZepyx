#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

if [ "$updates_arch" -gt 0 ] && [ "$updates_aur" -gt 0 ]; then
    echo "$updates_arch(+$updates_aur)"
elif [ "$updates_arch" -gt 0 ] && [ "$updates_aur" -le 0 ]; then
    echo "$updates_arch"
elif [ "$updates_arch" -le 0 ] && [ "$updates_aur" -gt 0 ]; then
    echo "0(+$updates_aur)"
fi



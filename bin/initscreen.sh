#!/bin/bash

WALLPAPER_DIR=~/Pictures/i3wallpapers/active

ps -u $USER | grep redshift >/dev/null || {
    echo "Starting redshift ..."
    redshift -l 49:6 -t 6000:2500 &
}

ps -u $USER | grep picom >/dev/null || {
    echo "Starting picom ..."
    # picom --backend glx &
    picom &
}

echo "Selecting wallpaper from '$WALLPAPER_DIR'"
wal -qi "$WALLPAPER_DIR" --backend haishoku --saturate 0.5

echo "init screen done."

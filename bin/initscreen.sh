#!/bin/bash

ps -C redshift >/dev/null || {
    redshift -l 49:6 -t 6000:2500 &
}

ps -C picom >/dev/null || {
    picom --backend glx &
}

wal -qi ~/Pictures/i3wallpapers/active --backend haishoku --saturate 0.5

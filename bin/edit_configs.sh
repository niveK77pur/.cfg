#!/bin/bash

directories=(
    alacritty/
    i3/
    lf/
    bash/
)


cd $HOME/.config
config_file="$(find ${directories[@]} -type f | dmenu -i -l 10 -p "config files: ")"

[ -n "$config_file" ] && i3-sensible-terminal --command nvim "$PWD/$config_file" &

#!/bin/bash

directory=~/Pictures/Papes/
monitor=eDP-1
# monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

if [ -d "$directory" ]; then
    random_background=$(ls $directory/*.png | shuf -n 1)

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $random_background
    hyprctl hyprpaper wallpaper "$monitor, $random_background"

fi

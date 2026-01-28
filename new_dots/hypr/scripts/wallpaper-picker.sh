#!/usr/bin/env bash

# define the wallpaper directory
WALLPAPER_DIR="$HOME/Wallpapers"

# use rofi to pick out wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | rofi -dmenu -i -p "Select Wallpaper")

# set the wallpaper using 'swww'
if [ -n "$WALLPAPER" ]; then
    swww img "$WALLPAPER" \
        --transition-type fade \
        --transition-fps 60 \
        --transition-duration 2
fi
#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Wallpapers"

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  notify-send "Wallpaper Picker" "Directory not found: $WALLPAPER_DIR"
  exit 1
fi

# Check if there are images
if ! ls "$WALLPAPER_DIR"/*.{jpg,png,jpeg} 1>/dev/null 2>&1; then
  notify-send "Wallpaper Picker" "No images found in $WALLPAPER_DIR"
  exit 1
fi

# Use sxiv for selection
cd "$WALLPAPER_DIR"
WALLPAPER=$(sxiv -t -o *.{jpg,png,jpeg} 2>/dev/null)

# Set wallpaper if selected
if [ -n "$WALLPAPER" ]; then
  FULLPATH="$WALLPAPER_DIR/$WALLPAPER"
  swww img "$FULLPATH" \
    --transition-type fade \
    --transition-fps 60 \
    --transition-duration 2

  # Optional: notify on success
  notify-send "Wallpaper Changed" "$(basename "$FULLPATH")"
fi

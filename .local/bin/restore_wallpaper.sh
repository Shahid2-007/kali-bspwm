#!/bin/bash
export DISPLAY=:0

wallpapers_dir="$HOME/.wallpapers"

mapfile -t wallpapers < <(find "$wallpapers_dir" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | sort)
count=${#wallpapers[@]}
[ "$count" -eq 0 ] && exit 1

index_file="$HOME/.cache/wallpaper_index"

# If no index file exists, set first wallpaper
if [ ! -f "$index_file" ]; then
  /usr/bin/feh --bg-scale "${wallpapers[0]}"
  exit 0
fi

saved_index=$(cat "$index_file")

# 👇 No -1 here anymore!
last_used=$saved_index

/usr/bin/feh --bg-scale "${wallpapers[$last_used]}"

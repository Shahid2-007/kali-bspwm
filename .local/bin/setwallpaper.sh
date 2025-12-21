#!/bin/bash
export DISPLAY=:0

wallpapers_dir="$HOME/.wallpapers"

mapfile -t wallpapers < <(find "$wallpapers_dir" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | sort)
count=${#wallpapers[@]}
[ "$count" -eq 0 ] && exit 1

index_file="$HOME/.cache/wallpaper_index"

# Read saved index or init to 0
if [ -f "$index_file" ]; then
  index=$(cat "$index_file")
else
  index=0
fi

case "$1" in
next)
  index=$(((index + 1) % count))
  ;;
prev)
  index=$(((index - 1 + count) % count))
  ;;
*)
  echo "Usage: $0 {next|prev}"
  exit 1
  ;;
esac

# Save updated index (IMPORTANT: before feh)
echo "$index" >"$index_file"

/usr/bin/feh --bg-scale "${wallpapers[$index]}"

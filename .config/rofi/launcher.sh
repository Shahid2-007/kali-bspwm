#!/usr/bin/env bash

# Detect if rofi is already running
if pgrep -x "rofi" >/dev/null; then
  pkill -x rofi
else
  rofi -no-config -show drun -modi drun -theme ~/.config/rofi/launcher.rasi
fi

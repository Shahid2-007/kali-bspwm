#!/bin/bash

# change brightness
brightnessctl set "$1"

# get new brightness percent
PERCENT=$(brightnessctl get)
MAX=$(brightnessctl max)
VAL=$((100 * PERCENT / MAX))

# send notification like Hyde
dunstify -a "brightness" -r 91190 -u low \
  -h int:value:$VAL \
  "Brightness: $VAL%"

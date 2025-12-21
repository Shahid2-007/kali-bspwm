#!/bin/bash

arg="$1"

if [[ "$arg" == "mute" ]]; then
  # Just toggle mute, don't change volume level
  pamixer --toggle-mute
else
  # Volume change logic
  if [[ "$arg" == +* ]]; then
    pamixer --increase "${arg#+}"
  elif [[ "$arg" == -* ]]; then
    pamixer --decrease "${arg#-}"
  else
    pamixer --set-volume "$arg"
  fi
fi

# get new volume percent
VAL=$(pamixer --get-volume)

# check mute state
MUTED=$(pamixer --get-mute)

# if muted, send muted notification
if [ "$MUTED" = "true" ]; then
  dunstify -a "volume" -r 91191 -u low \
    -h int:value:0 \
    "Volume: Muted"
  exit 0
fi

# normal volume notification
dunstify -a "volume" -r 91191 -u low \
  -h int:value:$VAL \
  "Volume: $VAL%"

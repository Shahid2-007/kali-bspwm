#!/usr/bin/env bash

# Get the state of the focused node
state=$(bspc query -T -n focused | sed -n 's/.*"state":"\([^"]*\)".*/\1/p')

if [[ "$state" == "fullscreen" ]]; then
  bspc node -t tiled
else
  bspc node -t fullscreen
fi

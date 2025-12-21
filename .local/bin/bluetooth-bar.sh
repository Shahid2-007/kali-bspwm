#!/bin/bash

powered=$(bluetoothctl show | grep "Powered: yes")

dev=$(bluetoothctl info | grep "Name:" | awk -F": " "{print \$2}")
if [ -z "$powered" ]; then
  echo ""
elif [ -n "$dev" ]; then
  echo ""
else
  echo ""
fi

#!/bin/bash

ip=$(ip -o -4 addr show | grep -E "tun|wg" | awk "{print \$4}" | head -n 1)
[ -n "$ip" ] && echo " $ip" || echo ""

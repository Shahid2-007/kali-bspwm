#!/bin/bash

updates=$(apt list --upgradeable 2>/dev/null | grep -c upgradable)
echo $updates

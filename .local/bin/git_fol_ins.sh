#!/bin/bash

# Usage: ./ghfolderdl.sh <github-folder-url> <output-folder>

GH_URL="$1"
OUT_DIR="$2"

if [[ -z "$GH_URL" || -z "$OUT_DIR" ]]; then
  echo "Usage: $0 <github-folder-url> <output-folder>"
  exit 1
fi

# Extract owner, repo, branch, and path
OWNER=$(echo "$GH_URL" | awk -F'github.com/' '{print $2}' | cut -d'/' -f1)
REPO=$(echo "$GH_URL" | awk -F'github.com/' '{print $2}' | cut -d'/' -f2)
BRANCH=$(echo "$GH_URL" | awk -F'tree/' '{print $2}' | cut -d'/' -f1)
PATH_IN_REPO=$(echo "$GH_URL" | awk -F"$BRANCH/" '{print $2}')

# API URL
API_URL="https://api.github.com/repos/$OWNER/$REPO/contents/$PATH_IN_REPO?ref=$BRANCH"

mkdir -p "$OUT_DIR"

# Fetch file list and download
curl -s "$API_URL" |
  jq -r '.[] | select(.type=="file") | .download_url' |
  while read url; do
    echo "Downloading: $url"
    wget -q -P "$OUT_DIR" "$url"
  done

echo "Done! Files saved in: $OUT_DIR"

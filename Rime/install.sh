#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/Library/Rime"

mkdir -p "$TARGET_DIR"

for file in default.custom.yaml squirrel.custom.yaml custom_phrase.txt; do
  if [[ -e "$TARGET_DIR/$file" || -L "$TARGET_DIR/$file" ]]; then
    mv "$TARGET_DIR/$file" "$TARGET_DIR/$file.old"
  fi

  cp "$CONFIG_DIR/$file" "$TARGET_DIR/$file"
done

cat <<EOF
Installed Rime custom files to:
  $TARGET_DIR

Next step:
  Re-deploy Rime from the Squirrel menu bar icon.
EOF

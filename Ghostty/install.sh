#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"
TARGET_FILE="$TARGET_DIR/config"
SOURCE_FILE="$CONFIG_DIR/config.ghostty"

mkdir -p "$TARGET_DIR"

if [[ -e "$TARGET_FILE" || -L "$TARGET_FILE" ]]; then
  mv "$TARGET_FILE" "$TARGET_FILE.old"
fi

cp "$SOURCE_FILE" "$TARGET_FILE"

cat <<EOF
Installed Ghostty config:
  $TARGET_FILE

Reload Ghostty config with:
  cmd+shift+,
EOF

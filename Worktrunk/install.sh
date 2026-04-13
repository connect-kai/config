#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/worktrunk"
TARGET_FILE="$TARGET_DIR/config.toml"
SOURCE_FILE="$CONFIG_DIR/config.toml"

mkdir -p "$TARGET_DIR"

if [[ -e "$TARGET_FILE" || -L "$TARGET_FILE" ]]; then
  mv "$TARGET_FILE" "$TARGET_FILE.old"
fi

ln -s "$SOURCE_FILE" "$TARGET_FILE"

cat <<EOF
Installed Worktrunk config:
  $TARGET_FILE -> $SOURCE_FILE
EOF

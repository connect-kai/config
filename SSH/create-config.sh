#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.ssh"
TARGET_FILE="$TARGET_DIR/config"
TEMPLATE_FILE="$CONFIG_DIR/config.template"

mkdir -p "$TARGET_DIR"
chmod 700 "$TARGET_DIR"

if [[ -e "$TARGET_FILE" || -L "$TARGET_FILE" ]]; then
  mv "$TARGET_FILE" "$TARGET_FILE.old"
fi

cp "$TEMPLATE_FILE" "$TARGET_FILE"
chmod 600 "$TARGET_FILE"

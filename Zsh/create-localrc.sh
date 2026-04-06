#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="$CONFIG_DIR/Zsh/localrc.template"
TARGET_FILE="$HOME/.localrc"

if [[ ! -e "$SOURCE_FILE" ]]; then
  echo "Template not found: $SOURCE_FILE" >&2
  exit 1
fi

if [[ -e "$TARGET_FILE" || -L "$TARGET_FILE" ]]; then
  mv "$TARGET_FILE" "${TARGET_FILE}.old"
fi

cp "$SOURCE_FILE" "$TARGET_FILE"
echo "Created $TARGET_FILE from template $SOURCE_FILE"

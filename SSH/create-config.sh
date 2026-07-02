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

# Proton Pass SSH agent as a launchd-supervised service (auto-start, auto-restart)
PLIST_TARGET="$HOME/Library/LaunchAgents/me.proton.pass.ssh-agent.plist"
mkdir -p "$HOME/Library/LaunchAgents" "$HOME/Library/Logs"
sed "s|__HOME__|$HOME|g" "$CONFIG_DIR/me.proton.pass.ssh-agent.plist.template" > "$PLIST_TARGET"
launchctl bootout "gui/$(id -u)/me.proton.pass.ssh-agent" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$PLIST_TARGET"

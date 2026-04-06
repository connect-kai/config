#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sfn "$CONFIG_DIR/tmux.conf" "$HOME/.tmux.conf"

if command -v tmux >/dev/null 2>&1; then
  tmux source-file "$HOME/.tmux.conf" >/dev/null 2>&1 || true
fi

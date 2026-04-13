#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Install it first from https://brew.sh" >&2
  exit 1
fi

bash "$CONFIG_DIR/Homebrew/brew.sh"
bash "$CONFIG_DIR/Git/setup-gitlab-glab.sh"
bash "$CONFIG_DIR/System/set-osx-defaults.sh"
bash "$CONFIG_DIR/System/set-osx-dock-apps.sh"
bash "$CONFIG_DIR/Ghostty/install.sh"
bash "$CONFIG_DIR/Rime/install.sh"
bash "$CONFIG_DIR/Zsh/install.sh"
bash "$CONFIG_DIR/Zsh/create-localrc.sh"
bash "$CONFIG_DIR/SSH/create-config.sh"
bash "$CONFIG_DIR/Tmux/install.sh"
bash "$CONFIG_DIR/Worktrunk/install.sh"

cat <<EOF
Done.

Next steps:
  1. Restart your shell or run: source ~/.zshrc && source ~/.localrc
  2. If needed, log in to GitLab: glab auth login --hostname gitlab.com --git-protocol ssh --use-keyring
EOF

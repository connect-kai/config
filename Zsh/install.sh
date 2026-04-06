#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_ZSHRC="$CONFIG_DIR/Zsh/zshrc.symlink"
OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"
ZSHRC_LINK="${HOME}/.zshrc"

if [[ ! -d "$OH_MY_ZSH_DIR" ]]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ -e "$ZSHRC_LINK" && ! -L "$ZSHRC_LINK" ]]; then
  mv "$ZSHRC_LINK" "${ZSHRC_LINK}.old"
fi

ln -sfn "$TARGET_ZSHRC" "$ZSHRC_LINK"

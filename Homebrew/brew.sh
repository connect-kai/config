#!/bin/bash

set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"


# First make sure Homebrew is installed from: https://brew.sh


# Set up important taps
brew tap oven-sh/bun

# Install binaries
brew install zsh
brew install git
brew install curl
brew install wget
brew install ripgrep
brew install git-lfs
brew install jq
brew install fd
brew install fzf
brew install direnv
brew install bat
brew install eza
brew install tmux
brew install python
brew install bun
brew install glab
brew install mole
brew install rustup
brew install protonpass/tap/pass-cli
brew install --cask mactex-no-gui
brew install --cask temurin@17

# Rust / Cargo
"$(brew --prefix rustup)/bin/rustup" default stable

# Git LFS
git lfs install

# NVM
brew install nvm
source $(brew --prefix nvm)/nvm.sh
NVM_DEFAULT_NODE="24.7.0"
nvm install "$NVM_DEFAULT_NODE"
nvm alias default "$NVM_DEFAULT_NODE"
nvm use "$NVM_DEFAULT_NODE"
unset NVM_DEFAULT_NODE

# Zsh
bash "$CONFIG_DIR/Zsh/install.sh"

# AltTab https://github.com/lwouis/alt-tab-macos
brew install --cask alt-tab

# Install Apps
brew install --cask spotify
brew install --cask google-chrome
brew install --cask proton-pass
brew install --cask squirrel-app
brew install --cask keka
brew install --cask appcleaner
brew install --cask microsoft-excel
brew install --cask microsoft-word
brew install --cask discord
brew install --cask linear-linear
brew install --cask vlc
brew install --cask raycast

# Dev Apps
brew install --cask orbstack
brew install --cask tableplus
brew install --cask ghostty
brew install --cask visual-studio-code
brew install --cask intellij-idea-ce

# Keyboard
brew install --cask karabiner-elements

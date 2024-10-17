#!/bin/bash


# First make sure Homebrew is installed from: https://brew.sh


# Set up important taps
brew tap homebrew/cask-fonts

# Install binaries
brew install zsh
brew install git
brew install curl
brew install wget
brew install ripgrep

# NVM
brew install nvm
source $(brew --prefix nvm)/nvm.sh

# Vim
brew install neovim

# Install Apps
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask spotify
brew install --cask microsoft-edge
brew install --cask input-source-pro
brew install --cask xmind
brew install --cask wechat

# Dev Apps
brew install --cask iterm2
brew install --cask docker
brew install --cask orbstack
brew install --cask sequel-ace

# Keyboard
brew install --cask karabiner-elements

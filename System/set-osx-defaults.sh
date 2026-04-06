#!/bin/bash

# Turn the display off after 5 minutes. Sleep after 20 minutes
# on battery and 60 minutes when connected to power.
sudo pmset -b displaysleep 10 sleep 20
sudo pmset -c displaysleep 20 sleep 60

# Use Caps-Lock as ESC key
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'

# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always show Hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show Finder path and status bars
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Keep folders on top and default to List view
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv

# Open new folders in windows instead of tabs
defaults write com.apple.finder FinderSpawnTab 0

# Go to Desktop instead of recent items when opening Finder
defaults write com.apple.finder NewWindowTarget PfDe
defaults write com.apple.finder NewWindowTargetPath "file://${HOME}/Desktop/"

# Always search within the current folder in Finder
defaults write com.apple.finder FXDefaultSearchScope 'SCcf'
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -int 0
defaults write com.apple.dock mouse-over-hilite-stack -int 1
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 2
defaults write com.apple.dock wvous-br-modifier -int 0

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Ask for password when waking up / lid is opened
defaults write com.apple.screensaver askForPassword -bool true

# but not if I open it back within 60 seconds
defaults write com.apple.screensaver askForPasswordDelay 60

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable Autocorrect, Period Substitution & Auto-capitalization
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool true
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool false

# Screenshot behavior
defaults write com.apple.screencapture show-thumbnail -bool false
defaults write com.apple.screencapture disable-shadow -bool true

# Disable Auto create .DS_Store file
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.desktopservices DSDontWriteUSBStores true

# Restart Finder and other Services
killall Finder
killall Dock

echo "Success! All OS X defaults are set."
echo
echo "Some changes will not take effect until you reboot your machine."

function reboot() {
  read -p "Do you want to reboot your machine now (yes/no)? " choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer!" && return;;
  esac
}

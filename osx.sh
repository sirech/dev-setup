#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#
# GENERAL
#

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Avoid reopening windows after restart
sudo chown root ~/Library/Preferences/ByHost/com.apple.loginwindow*
sudo chmod 000 ~/Library/Preferences/ByHost/com.apple.loginwindow*

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Menu bar: hide the Time Machine, Volume, and User icons
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
    defaults write "${domain}" dontAutoLoad -array \
        "/System/Library/CoreServices/Menu Extras/User.menu"
done

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable "natural" (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Show battery percent
defaults write com.apple.menuextra.battery ShowPercent YES

#
# iTerm 2
#

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dev-setup/apps/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true


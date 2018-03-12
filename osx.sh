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

# Disable gamed
# sudo defaults write /System/Library/LaunchAgents/com.apple.gamed.plist disabled -bool true

# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning false

# Quit printer app once done
defaults write com.apple.print.PrintingPrefs "Quit When Finished" true

# Revel extra info on clock click
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Screenshots to docs
mkdir -p "${HOME}/Documents/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Documents/Screenshots"

# Set computer name
# shellcheck disable=SC2086
read -rp 'Computer Name: ' computer
# scutil --set HostName "${computer}"
scutil --set LocalHostName "${computer}"
scutil --set ComputerName "${computer}"
dscacheutil -flushcache

#
# Display
#

# Enable HiDPI display modes
# sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true

#
# Safari
#

# Don't show the try safari notifications
defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z
defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 10.99

#
# iTerm 2
#

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dev-setup/apps/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

#
# Finder
#

# Display full path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle true

#
# Dock
#

# Only display active apps
defaults write com.apple.dock static-only -bool TRUE

# Set orientation
defaults write com.apple.dock orientation -string left

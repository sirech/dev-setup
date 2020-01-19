#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Browsers
declare -a browsers=(freesmug-chromium firefox google-chrome)
for i in "${browsers[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Archives
declare -a archives=(dropbox the-unarchiver)
for i in "${archives[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Utils
declare -a utils=(fluid keepassxc veracrypt)
for i in "${utils[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Productivity
declare -a productivity=(alfred dash hammerspoon karabiner-elements keycue)
for i in "${productivity[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Development
declare -a development=(emacs iterm2 visual-studio-code)
for i in "${development[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done
ln -s ~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient /usr/local/bin/emacsclient

# Tools
declare -a tools=(docker ccmenu postman)
for i in "${tools[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Visuals
declare -a visuals=(skitch xmind xscope)
for i in "${visuals[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Quicklook
declare -a quicklook=(quicklook-json qlmarkdown qlstephen)
for i in "${quicklook[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Communication
declare -a communication=(whale slack google-chat)
for i in "${communication[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Security
declare -a security=(keybase private-internet-access)
for i in "${security[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

Drawing
declare -a drawing=(sketchbook)
for i in "${drawing[@]}" ; do
  brew cask install --appdir="/Applications" "${i}"
done

# Fonts
brew tap caskroom/fonts
declare -a fonts=(font-inconsolata font-inconsolata-for-powerline font-awesome-terminal-fonts font-jetbrains-mono)
for i in "${fonts[@]}" ; do
    brew cask install "${i}"
done

# Drivers
brew tap caskroom/drivers

# Remove outdated versions from the cellar.
brew cleanup

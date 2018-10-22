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

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
# Overwrite grep
brew install grep --with-default-names

# basic
declare -a basic=(ack aspell curl htop-osx gcc git jq openssh R the_silver_searcher vim watch wget)
for i in "${basic[@]}" ; do
    brew install "${i}"
done

# tools
declare -a tools=(tmux zsh)
for i in "${tools[@]}" ; do
    brew install "${i}"
done

# node
brew install watchman

# notifications
brew install reattach-to-user-namespace
brew install terminal-notifier

# linters
brew install hadolint
brew install shellcheck

# utils
brew install mackup

# Install Python
brew install python
brew install python3

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Browsers
declare -a browsers=(freesmug-chromium firefox google-chrome)
for i in "${browsers[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Archives
declare -a archives=(appcleaner disk-inventory-x dropbox the-unarchiver)
for i in "${archives[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Utils
declare -a utils=(fluid keepassxc phoneclean veracrypt)
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
declare -a tools=(docker ccmenu etcher launchrocket little-snitch postman)
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
declare -a communication=(yakyak whale slack google-chat)
for i in "${communication[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Security
declare -a security=(keybase)
for i in "${security[@]}" ; do
    brew cask install --appdir="/Applications" "${i}"
done

# Drawing
declare -a drawing=(sketchbook wacom-intuos-tablet)
for i in "${drawing[@]}" ; do
  brew cask install --appdir="/Applications" "${i}"
done

# Fonts
brew tap caskroom/fonts
declare -a fonts=(font-inconsolata font-inconsolata-for-powerline font-awesome-terminal-fonts)
for i in "${fonts[@]}" ; do
    brew cask install "${i}"
done

# Drivers
brew tap caskroom/drivers

# Remove outdated versions from the cellar.
brew cleanup

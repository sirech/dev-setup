#!/usr/bin/env bash

# Install security relevant tools.

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

# gpg
brew install gpg2
brew install hopenpgp-tools

# yubikey
brew install yubikey-personalization
brew install pinentry-mac
brew install --cask yubico-authenticator

# gopass
brew install gopass

# Remove outdated versions from the cellar.
brew cleanup

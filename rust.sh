#!/usr/bin/env bash

# Install rust and libraries

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

if test ! $(which rustup); then
  echo "Installing rustup..."
  curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
fi
rustup update

# Remove outdated versions from the cellar.
brew cleanup

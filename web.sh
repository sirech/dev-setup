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

brew install node

mkdir -p ~/.n
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# Remove outdated versions from the cellar.
brew cleanup

n latest

npm install -g yarn
npm install -g tern
npm install -g flow-typed

# TypeScript
npm install -g typescript
npm install -g tslint
npm install -g typescript-formatter

# RemarkJS
npm install -g backslide

#gem install jekyll

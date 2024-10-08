#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, `g`-prefixed.
brew install gnu-sed
# Install Bash 4.
brew install bash
# Overwrite `grep` , `g`-prefixed.
brew install grep

# basic
declare -a basic=(ack aspell htop-osx gcc git git-delta openssh R the_silver_searcher tree vim watch wget)
for i in "${basic[@]}" ; do
    brew install "${i}"
done

# json
declare -a json=(jq python-yq)
for i in "${json[@]}" ; do
  brew install "${i}"
done

# http
declare -a json=(httpie mkcert)
for i in "${json[@]}" ; do
  brew install "${i}"
done

# rust based
declare -a rust=(bat fd eza procs ripgrep tokei)
for i in "${rust[@]}" ; do
  brew install "${i}"
done

# tools
declare -a tools=(tmux zsh)
for i in "${tools[@]}" ; do
    brew install "${i}"
done

# goodies
brew tap wagoodman/dive
declare -a goodies=(dive fzf ncdu)
for i in "${goodies[@]}" ; do
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
brew install bats
brew install rclone

# Install Python
brew install python
brew install python3

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew install imagemagick
brew install gomplate
brew install goaccess

# alternative to macfuse
brew install macos-fuse-t/homebrew-cask/fuse-t-sshfs

# Remove outdated versions from the cellar.
brew cleanup

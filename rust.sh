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
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
rustup update

rustup component add \
       rls \
       rust-analysis \
       rust-src \
       clippy

cargo install cargo-fix
cargo install cargo-edit
cargo install cargo-outdated

# Build linux binaries from OSX
rustup target add x86_64-unknown-linux-musl

# Make smaller binaries
brew install upx

# Remove outdated versions from the cellar.
brew cleanup

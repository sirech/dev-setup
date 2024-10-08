#!/usr/bin/env bash

# Install command-line tools using Homebrew.

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
declare -a browsers=(google-chrome@canary)
for i in "${browsers[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Archives
declare -a archives=(the-unarchiver)
for i in "${archives[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Utils
declare -a utils=(keepassxc veracrypt)
for i in "${utils[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Productivity
declare -a productivity=(alfred dash hammerspoon karabiner-elements keycue)
for i in "${productivity[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Development
declare -a development=(emacs iterm2)
for i in "${development[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Fix emacsclient
ln -s /Applications/Emacs.app/Contents/MacOS/bin/emacsclient /usr/local/bin/emacsclient

# Fix Emacs launching in Catalina
(cd ~/Applications/Emacs.app/Contents/MacOS &&
   mv Emacs Emacs-launcher &&
   ln -s Emacs-x86_64-10_14 Emacs)
(cd ~/Applications/Emacs.app/Contents/ &&
   rm -rf _CodeSignature)

# Tools
declare -a tools=()
for i in "${tools[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Visuals
declare -a visuals=(xscope)
for i in "${visuals[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Quicklook
declare -a quicklook=(quicklook-json qlmarkdown qlstephen)
for i in "${quicklook[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Communication
declare -a communication=()
for i in "${communication[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Security
declare -a security=()
for i in "${security[@]}" ; do
    brew install --cask --appdir="~/Applications" "${i}"
done

# Fonts
brew tap homebrew/cask-fonts
declare -a fonts=(font-inconsolata font-inconsolata-for-powerline font-awesome-terminal-fonts font-jetbrains-mono)
for i in "${fonts[@]}" ; do
    brew install --cask "${i}"
done

# Remove outdated versions from the cellar.
brew cleanup

#!/usr/bin/env bash

# Install devops tools using Homebrew.

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

brew install tfenv
brew install lazydocker

# HashiCorp
# brew install consul
# brew install vault

# Packer
brew install packer

# VMs
brew install --cask virtualbox
brew install --cask vagrant
vagrant plugin install vagrant-scp

# K8s
# brew install --cask minikube
brew install kubernetes-cli
# Docker installs its own version of kubectl
brew link --overwrite kubernetes-cli
brew install derailed/k9s/k9s
brew install kubernetes-helm
brew install kustomize

# AWS stuff
brew install awscli
brew tap sam701/awstools
brew install awstools
pip3 install awslogs
brew tap gjbae1212/gossm
brew install gossm

# Remove outdated versions from the cellar.
brew cleanup

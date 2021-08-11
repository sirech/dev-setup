#!/usr/bin/env bash

# Install ruby.

# Ask for the administrator password upfront.
sudo -v

ruby_version=2.7.1

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

~/.rbenv/bin/rbenv install ${ruby_version}
~/.rbenv/bin/rbenv global ${ruby_version}
~/.rbenv/shims/gem install bundle scss_lint_reporter_checkstyle
sh ~/shell/irbrc/install.sh

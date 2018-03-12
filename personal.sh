#!/usr/bin/env bash

if [ ! -d "${HOME}/.ssh" ] ; then
    ssh-keygen -t rsa
fi

git clone https://github.com/sirech/shell.git --origin github ~/shell
sh ~/shell/full-install.sh
source ~/.bashrc

git clone https://github.com/zsh-users/zsh-completions.git --origin github ~/shell/zshrc/completions
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
git clone https://github.com/sirech/spacemacs.d.git --origin github ~/.spacemacs.d

git clone https://github.com/sirech/hammerspoon.git --origin github ~/.hammerspoon

mkdir -p workspace

#!/usr/bin/env bash

if [ ! -d "${HOME}/.ssh" ] ; then
    ssh-keygen -t ed25519
fi


git clone https://github.com/sirech/prezto.git --origin github ~/.zprezto
zsh ~/.zprezto/setup.zsh
git clone https://github.com/sirech/dotfiles.git --origin github ~/dotfiles
sh ~/dotfiles/install.sh

git clone -b develop https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
git clone https://github.com/sirech/spacemacs.d.git --origin github ~/.spacemacs.d

git clone https://github.com/sirech/hammerspoon.git --origin github ~/.hammerspoon

git clone https://github.com/MarcoIeni/intellimacs.git ~/.intellimacs

#ln -s "${PWD}/apps/vscode/settings.json" "$HOME/Library/Application Support/Code/User"
#ln -s "${PWD}/apps/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User"
#ln -s "${PWD}/apps/vscode/snippets" "$HOME/Library/Application Support/Code/User"
#cat "${PWD}/apps/vscode/extensions" | xargs -L 1 code --install-extension

mkdir -p mine
mkdir -p work

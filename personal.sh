#!/usr/bin/env bash

if [ ! -d "${HOME}/.ssh" ] ; then
    ssh-keygen -t ed25519
fi

git clone https://github.com/sirech/shell.git --origin github ~/shell
sh ~/shell/full-install.sh
source ~/.bashrc

git clone https://github.com/zsh-users/zsh-completions.git --origin github ~/shell/zshrc/completions
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k


git clone -b develop https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
git clone https://github.com/sirech/spacemacs.d.git --origin github ~/.spacemacs.d

git clone https://github.com/sirech/hammerspoon.git --origin github ~/.hammerspoon

git clone https://github.com/MarcoIeni/intellimacs.git ~/.intellimacs

ln -s "${PWD}/apps/vscode/settings.json" "$HOME/Library/Application Support/Code/User"
ln -s "${PWD}/apps/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User"
ln -s "${PWD}/apps/vscode/snippets" "$HOME/Library/Application Support/Code/User"
cat "${PWD}/apps/vscode/extensions" | xargs -L 1 code --install-extension

mkdir -p mine
mkdir -p work

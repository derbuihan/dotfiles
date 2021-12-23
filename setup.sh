#!/bin/bash

#DOT_FILES=(.bashrc .bash_profile .zshrc .ghci .gitconfig .gitignore_global .tmux.conf .vimrc .emacs.d/init.el)
DOT_FILES=(.zshrc .gitconfig .gitignore_global .tmux.conf .vimrc)

for file in ${DOT_FILES[@]}
do
    ln -sf $HOME/dotfiles/$file $HOME/$file
done



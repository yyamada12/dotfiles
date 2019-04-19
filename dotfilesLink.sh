#!/bin/sh
set -eu
# set -x

ln -nfs ~/dotfiles/.bash_profile  ~/.bash_profile
ln -nfs ~/dotfiles/.bashrc ~/.bashrc
ln -nfs ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -nfs ~/dotfiles/.gitconfig  ~/.gitconfig
ln -nfs ~/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/dotfiles/.zshrc ~/.zshrc
ln -nfs ~/dotfiles/.zprofile ~/.zprofile

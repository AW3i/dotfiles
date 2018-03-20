#!/bin/bash

currentDir=`pwd`;
mkdir $HOME/.bin
echo "Creating Symlinks";
ln -sf $currentDir/vim/vimrc $HOME/.vimrc;
ln -sf $currentDir/tmux.conf $HOME/.tmux.conf;
ln -sf $currentDir/xinitrc $HOME/.xinitrc;
ln -sf $currentDir/Xresources $HOME/.Xresources;
ln -sf $currentDir/xxkbrc $HOME/.xxkbrc;
ln -sf $currentDir/zshrc $HOME/.zshrc;
ln -sf $currentDir/vim $HOME/.vim;
ln -sf $currentDir/tmux $HOME/.tmux;
ln -sf $currentDir/bin/lgit $HOME/.bin/lgit;
echo "Installing vim plugins";
nvim +PlugInstall +qall;
echo "Done";

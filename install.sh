#!/bin/bash

currentDir=`pwd`;
echo "Creating Symlinks";
ln -s $currentDir/vim/vimrc $HOME/.vimrc;
ln -s $currentDir/tmux.conf $HOME/.tmux.conf;
ln -s $currentDir/xinitrc $HOME/.xinitrc;
ln -s $currentDir/Xresources $HOME/.Xresources;
ln -s $currentDir/xxkbrc $HOME/.xxkbrc;
ln -s $currentDir/zshrc $HOME/.zshrc;
ln -s $currentDir/vim $HOME/.vim;
ln -s $currentDir/tmux $HOME/.tmux;
echo "Installing vim plugins";
vim +PlugInstall +qall;
echo "Done";

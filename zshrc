export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="reddish"

XDG_CONFIG_HOME=$HOME/.config

alias mc='mc --skin modarin256.ini'
alias mcx='mc --skin modarcon16.ini'
alias du='du -h'
alias h='cd $HOME'
alias c='clear'

bindkey -a u undo
bindkey -a '^R' redo
eval `keychain --eval --agents ssh id_rsa`

plugins=(git vi-mode autojump)

source $ZSH/oh-my-zsh.sh
export GOPATH=$HOME/Documents/programming/go
export GOBIN=$GOPATH/bin
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:$HOME/.bin:/opt/bin:$GOBIN

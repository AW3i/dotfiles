# Path to your oh-my-zsh configuratgallifreySH=$HOME/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="reddish"

#ZSH_THEME="random"
XDG_CONFIG_HOME=$HOME/.config

alias -g irx='ssh user@server'
alias -g tunnel='ssh -D 8088 -f -C -q -N user@domain'
alias -g sfs='sshfs user@domain:/remotedir/ /localdir/ -C '
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

export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:$HOME/.bin:/opt/bin

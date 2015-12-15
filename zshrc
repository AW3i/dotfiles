export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="reddish"

XDG_CONFIG_HOME=$HOME/.config

alias mc='mc --skin modarin256.ini'
alias mcx='mc --skin modarcon16.ini'
alias du='du -h'
alias h='cd $HOME'
alias c='clear'
alias nvim='nvim-remote.py --remote'

bindkey -a u undo
bindkey -a '^R' redo
eval `keychain --eval --agents ssh id_rsa`

plugins=(git vi-mode autojump)

source $ZSH/oh-my-zsh.sh
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export GOPATH=$HOME/Documents/programming/go
export GOBIN=$GOPATH/bin
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export EDITOR=/usr/bin/vi
export VISUAL=/usr/bin/vi
export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:$HOME/.bin:/opt/bin:$GOBIN
export FZF_DEFAULT_OPTS='
    --bind ctrl-f:page-down,ctrl-b:page-up
    --multi --bind "ctrl-a:select-all,ctrl-d:deselect-all"
    --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
    --color info:183,prompt:110,spinner:107,pointer:167,marker:215
'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

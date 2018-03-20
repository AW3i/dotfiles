export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="reddish"

XDG_CONFIG_HOME=$HOME/.config

alias mc='mc --skin modarin256.ini'
alias mcx='mc --skin modarcon16.ini'
alias du='du -h'
alias h='cd $HOME'
alias c='clear'
alias gsquash='git reset --soft HEAD~3 && git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"'

bindkey -a u undo
bindkey -a '^R' redo
eval "$(dircolors ~/.dir_colors)"
eval `keychain --eval --noask --agents ssh id_rsa`
alias ssh='TERM=xterm-256color ssh'
alias lssh='TERM=xterm-256color ledger-agent --connect'
alias m='f -e mpv' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open
alias git_hub='ledger-agent -v -e ed25519 git@github.com -- git'

plugins=(git vi-mode docker fasd)

source $ZSH/oh-my-zsh.sh
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export GOPATH=$HOME/ownCloud/programming/go
export GOBIN=$GOPATH/bin
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export EDITOR=/usr/bin/vi
export VISUAL=/usr/bin/vi
export GNUPGHOME=$HOME/.gnupg/ledger
export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:$HOME/.bin:/opt/bin:$GOBIN:/usr/lib/node_modules/grunt-cli/bin/:$HOME/.cargo/bin:$HOME/.config/composer/vendor/bin:$HOME/.local/bin
export FZF_DEFAULT_OPTS='
    --bind ctrl-f:page-down,ctrl-b:page-up
    --multi --bind "ctrl-a:select-all,ctrl-d:deselect-all"
    --color hl:103,fg+:222,bg+:234,hl+:104
    --color info:183,prompt:110,spinner:107,pointer:167,marker:215
'
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
fi

j() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

e() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fasd --init auto)"

# ALT-I - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
  local selected
  if selected=$(locate / | fzf -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N    fzf-locate-widget
bindkey '\ei' fzf-locate-widget

fzf-locate() { xdg-open "$(locate "*" | fzf -e)" ;}

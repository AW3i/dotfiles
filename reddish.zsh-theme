# The prompt

PROMPT='%{$fg[red]%}%m♠%{$reset_color%}%{$fg[white]%} %c%{$reset_color%}%{$fg_bold[red]%} ➜ %{$reset_color%}'

# The right-hand prompt

RPROMPT='$(vi_mode_prompt_info) ${return_code}%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="✹  %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ☂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%} ☁"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ⚡"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ✤" 
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ♒"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%} ↑"


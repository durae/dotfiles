chpwd() { print -Pn "\e]2; %~/ \a" }

# Save history into file
HISTFILE=~/.zsh_history

# For setting history length see HISTSIZE and SAVEHIST in zsh(1)
HISTSIZE=1000
SAVEHIST=2000

# Don't put duplicate lines in the history
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# Setup prompt
setopt PROMPT_SUBST
PROMPT="%F{green}%n%f@%F{green}%m%f:%F{blue}%c%f $ "
PROMPT2="%F{blue}>%f"
RPROMPT="%F{yellow}%T%f"

# Both imports commands from history and append typed commands
setopt SHARE_HISTORY

# Completion
autoload -U compinit
compinit

# Completion of command line switches for aliases
setopt COMPLETE_ALIASES

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Approximate completion
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# No completion for command we do not have
zstyle ':completion:*:functions' ignored-patterns '_*'

# Use colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Provide description
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# Use cache
zstyle ':completion:*' use-cache on

# Tab completion for process identifiers
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# Clever rm
zstyle ':completion:*:rm:*' ignore-line yes

# Colors
autoload -U colors
colors

# Colored man pages
export LESS_TERMCAP_mb=$'\e[00;31m'
export LESS_TERMCAP_md=$'\e[00;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[00;36m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[00;31m'

# Necessary to make colored man pages work
export GROFF_NO_SGR=1

# Aliases
alias ls='ls -G'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Few more useful aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

fpath=(/usr/local/share/zsh-completions $fpath)

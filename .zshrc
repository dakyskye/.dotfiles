# source $HOME/.profile, just in case
. $HOME/.profile

# start starship prompt
eval "$(starship init zsh)"

# history file settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

# oh my zsh
export ZSH="$CONFIG/oh-my-zsh"

# suggest auto correction for commands
ENABLE_CORRECTION="true"

# display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# custom timestamp format for history
HIST_STAMPS="dd.mm.yyyy"

# zsh plugins
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions history-substring-search vi-mode sudo fzf ripgrep gitignore emoji emoji-clock)

# required for zsh-completions plugin
autoload -U compinit && compinit

# source oh-my-zsh shell script
source $ZSH/oh-my-zsh.sh

# aliases
alias vim="nvim"

alias ls="exa --color always --group-directories-first"
alias la="exa -a --color always --group-directories-first"
alias ll="exa -al --color always --group-directories-first"
alias lg="exa -alg --color always --group-directories-first"
alias lh="exa -alh --color always --group-directories-first"
alias lgh="exa -algh --color always --group-directories-first"
alias lt="exa -aT --color always --group-directories-first"

alias rm="rm -i"
alias cp="cp -i"
alias df="df -h"
alias du="du -h"
alias free="free -m"
alias tb="nc termbin.com 9999"

alias ..="cd .."
alias ...="cd ../.."

# load zsh syntax highlighting
source "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

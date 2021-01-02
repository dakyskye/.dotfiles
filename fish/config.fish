# launch starship prompt
starship init fish | source

# aliases
alias vim "nvim"
alias emacs "emacsclient -c -a emacs"
alias spotify "spotify-tray"

alias ls "exa --color always --group-directories-first"
alias la "exa -a --color always --group-directories-first"
alias ll "exa -al --color always --group-directories-first"
alias lg "exa -alg --color always --group-directories-first"
alias lh "exa -alh --color always --group-directories-first"
alias lgh "exa -algh --color always --group-directories-first"
alias lt "exa -aT --color always --group-directories-first -I .git"

alias rm "rm -i"
alias cp "cp -i"
alias df "df -h"
alias du "du -h"
alias free "free -m"
alias tb "nc termbin.com 9999"
alias copy "xclip -selection clipboard"
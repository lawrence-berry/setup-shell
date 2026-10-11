# Essential aliases: portable across zsh (Mac) and bash (Linux servers).

alias m='make'
alias g='git'
alias e='exit'
alias c='cat'
alias md='mkdir'

alias psg='ps aux | grep '
alias exe='sudo chmod +x'
alias h='history'
alias hg='history | grep'
alias la='ls -ahl'

alias rs='rails'
alias re='rake'
alias dc='docker-compose'
alias be='bundle exec'
alias b='bundle'
alias health='htop'

# Alias management. $1 is this repo's path, passed in by load.sh.
alias ale="code \"$1\""
alias alev="cat \"$1\"/aliases/*.sh \"$1/aliases/\$(uname -s)\"/*.sh"

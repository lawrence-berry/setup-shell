# Miscellaneous aliases.

alias bigfiles='find . -type f -size +10M -exec du -h {} + | sort -rh'
alias allextensions="find . -type f -name '*.*' | sed 's@.*/.*\.@.@' | sort -u"
alias thematrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock 2>/dev/null | GREP_COLORS="mt=1;32" grep --color "[^ ]"'
alias lastdl='ls -td ~/Downloads/* | head -1'
alias getlastdl='mv "$(ls -td ~/Downloads/* | head -1)" .'

# Saves this shell's history to ./history.txt. zsh and bash write history differently.
if [ -n "$ZSH_VERSION" ]; then alias exporthistory='fc -W history.txt'; else alias exporthistory='history -w history.txt'; fi

# Miscellaneous aliases.

alias bigfiles='find . -type f -size +10M -exec du -h {} + | sort -rh'
alias allextensions="find . -type f -name '*.*' | sed 's@.*/.*\.@.@' | sort -u"
alias thematrix='LC_ALL=C tr -dc "a-z0-9" < /dev/urandom | tr "a-z" " " | dd cbs=$COLUMNS conv=unblock 2>/dev/null | GREP_COLOR="1;32" GREP_COLORS="mt=1;32" grep --color "[^ ]"'  # more letters in a-z = sparser; BSD grep reads GREP_COLOR, GNU GREP_COLORS
alias exporthistory='fc -ln 1 > history.txt'
alias lastdl='ls -td ~/Downloads/* | head -1'
alias getlastdl='mv "$(ls -td ~/Downloads/* | head -1)" .'

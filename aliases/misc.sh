# Miscellaneous aliases.

alias bigfiles='find . -type f -size +10M -exec du -h {} + | sort -rh'
alias allextensions="find . -type f -name '*.*' | sed 's@.*/.*\.@.@' | sort -u"
# Random digits in seven shades of green (256-colour codes, dark to bright). .28 sets the density.
alias thematrix='awk -v w="${COLUMNS:-80}" '\''BEGIN { srand(); split("22 28 34 40 46 82 120", g); while (1) { l = ""; for (i = 0; i < w; i++) l = l (rand() < .28 ? "\033[38;5;" g[int(rand() * 7) + 1] "m" int(rand() * 10) : " "); print l "\033[0m"; fflush() } }'\'''
alias exporthistory='fc -ln 1 > history.txt'
alias lastdl='ls -td ~/Downloads/* | head -1'
alias getlastdl='mv "$(ls -td ~/Downloads/* | head -1)" .'

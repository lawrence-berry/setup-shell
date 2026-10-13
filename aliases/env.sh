# Environment. Portable across zsh (Mac) and bash (Linux servers).

export EDITOR=nvim

# History: write each command at once and share across open sessions, so a new
# terminal (or up-arrow in another) sees what you just ran elsewhere.
HISTSIZE=50000
if [ -n "$ZSH_VERSION" ]; then
  SAVEHIST=50000
  setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS
elif [ -n "$BASH_VERSION" ]; then
  HISTFILESIZE=50000
  HISTCONTROL=ignoreboth:erasedups
  shopt -s histappend
  PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
fi

# Executables from `gem install --user-install` (setup-ruby), any Ruby version.
# `find`, not a glob (zsh errors on a glob with no match) and not `ruby -e` (no Ruby at shell startup).
for _d in $(find "$HOME/.gem/ruby" -maxdepth 2 -name bin -type d 2>/dev/null); do PATH="$_d:$PATH"; done; unset _d

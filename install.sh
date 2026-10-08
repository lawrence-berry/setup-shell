#!/bin/sh
# Sources essentials.sh from your login shell's rc file: zsh, falling back to bash. Safe to re-run.
set -e
src="$(cd "$(dirname "$0")" && pwd)/essentials.sh"
line="[ -f \"$src\" ] && . \"$src\"  # setup-shell"

case "$SHELL" in *zsh) rc="$HOME/.zshrc" ;; *) rc="$HOME/.bashrc" ;; esac
# ponytail: matches on the marker, so moving the repo leaves a stale path; edit the line by hand if you move it
if grep -qs '# setup-shell$' "$rc"; then
  echo "already set up: $rc"
else
  printf '\n%s\n' "$line" >> "$rc"
  echo "added to: $rc"
fi

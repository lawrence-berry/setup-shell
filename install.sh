#!/bin/sh
# Adds a line to your login shell's rc file (zsh, falling back to bash) that sources load.sh. Safe to re-run.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
line=". \"$dir/load.sh\" \"$dir\"  # setup-shell"
case "$SHELL" in *zsh) rc="$HOME/.zshrc" ;; *) rc="$HOME/.bashrc" ;; esac

# Drop any older setup-shell line, then add the current one.
if [ -f "$rc" ]; then
  grep -v '# setup-shell$' "$rc" > "$rc.tmp" || true
  cat "$rc.tmp" > "$rc" && rm "$rc.tmp"
fi
[ -n "$(tail -c1 "$rc" 2>/dev/null)" ] && echo >> "$rc"  # add a missing final newline
printf '%s\n' "$line" >> "$rc"
echo "set up: $rc"

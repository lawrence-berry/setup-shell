#!/bin/sh
# Loads every aliases/*.sh (aliases/linux.sh only on Linux) from your login shell's rc file: zsh, falling back to bash. Safe to re-run.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
load='. "$_f"'
[ "$(uname -s)" = Linux ] || load='[ "${_f##*/}" = linux.sh ] || . "$_f"'
line="for _f in \"$dir/aliases\"/*.sh; do $load; done; unset _f  # setup-shell"

case "$SHELL" in *zsh) rc="$HOME/.zshrc" ;; *) rc="$HOME/.bashrc" ;; esac
if grep -qsxF "$line" "$rc"; then
  echo "already set up: $rc"
  exit
fi

# Drop any older setup-shell line (old layout or moved repo) before adding the current one.
if [ -f "$rc" ]; then
  grep -v '# setup-shell$' "$rc" > "$rc.tmp" || true
  cat "$rc.tmp" > "$rc" && rm "$rc.tmp"
fi
[ -n "$(tail -c1 "$rc" 2>/dev/null)" ] && echo >> "$rc"  # add a missing final newline
printf '%s\n' "$line" >> "$rc"
echo "set up: $rc"

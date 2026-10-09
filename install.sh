#!/bin/sh
# Loads aliases/*.sh plus aliases/mac/*.sh or aliases/linux/*.sh from your login shell's rc file: zsh, falling back to bash. Safe to re-run.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
case "$(uname -s)" in Darwin) os=mac ;; *) os=linux ;; esac
line="for _f in \"$dir/aliases\"/*.sh \"$dir/aliases/$os\"/*.sh; do . \"\$_f\"; done; unset _f  # setup-shell"

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

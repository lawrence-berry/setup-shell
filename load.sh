# Loads the shared aliases plus this platform's folder (aliases/Darwin or aliases/Linux, named after `uname -s`).
# Sourced from your shell's rc file by the line install.sh adds, which passes the repo path as $1.
for _f in "$1/aliases"/*.sh "$1/aliases/$(uname -s)"/*.sh; do . "$_f"; done; unset _f

# Per-machine overrides (exports, aliases): keep this file out of the repo.
# Loaded last so it can override anything above.
if [ -f "$HOME/.shell.local" ]; then . "$HOME/.shell.local"; fi

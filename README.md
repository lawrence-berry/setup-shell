# setup-shell

<p align="center"><img src="public/icon.png" alt="setup-shell icon" width="96" height="96"></p>

Shell aliases that work in both zsh on macOS and bash on Linux. Each group of aliases has its own file in `aliases/`, and every file there is loaded automatically. Platform-only aliases go in `aliases/Darwin/` (macOS) or `aliases/Linux/`, named after what `uname -s` prints, and only the current platform's folder is loaded.

## Install

```sh
./install.sh
```

This adds one line that sources `load.sh` to your login shell's config file: `~/.zshrc` if your shell is zsh, otherwise `~/.bashrc`. `load.sh` loads every `aliases/*.sh` file plus your platform's folder, so adding or moving alias files needs no reinstall. Re-running it replaces any older setup-shell line (for example after moving the repo) and leaves the rest of the file alone.

## Tests

```sh
bundle install --path vendor/bundle
bundle exec rspec
```

RSpec installs into `vendor/bundle` inside this repo. The `rspec` gem is only for this repo's tests; the gems for your Ruby console live in `setup-ruby`.

## TODO

- [ ] Tidy up `~/Projects/util`. Go through each folder: anything that's only notes moves to `~/Notes`, one file per repo. Working code moves into the `setup-*` repos.
  - [ ] aliasify
  - [x] bash_helpers (now `~/Notes/bash.md`)
  - [ ] colour_pallette
  - [x] fire_stick_helpers (now `~/Notes/fire_stick.md`)
  - [ ] geo_me-makefile
  - [x] mac_helpers (now `~/Notes/mac/`)
  - [ ] new_repo
  - [x] pi_utils (now `~/Notes/pi.md`)
  - [ ] random-stylesheets (no longer in `~/Projects/util`; moved somewhere, or lost?)
  - [ ] rb_swap
  - [ ] repo_sync
  - [x] ruby_helpers (now `~/Notes/ruby.md`)
  - [ ] svotd
  - [ ] terminal_aliases (essentials, git, linux, mac, locations, networking, misc (with lastdl and getlastdl as aliases) done; still to do: the rest of `fish/aliases.sh` one section per file, local aliases file, gitconfig, SSH config, Ruby/pry config, Linux server one-liner)
  - [ ] vim_config
  - [x] virtualisation_helpers (now `~/Notes/virtualbox.md`)
  - [ ] vpn_helpers (no longer in `~/Projects/util`; moved somewhere, or lost?)
- [x] Install `nmap` (needed by `alllocalips` in `aliases/networking.sh`) — in the setup-mac Brewfile.
- [x] Install the GitHub CLI `gh` (needed by setup-git's `wgd` alias) — in the setup-mac Brewfile. You still run `gh auth login` once per machine.

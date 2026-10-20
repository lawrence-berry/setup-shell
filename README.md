<p align="center"><img src="public/icon.png" alt="setup-shell icon" width="128" height="128"></p>

<h1 align="center">setup-shell</h1>

<p align="center"><b>Shell aliases that load the same way in zsh on macOS and bash on Linux, one file per group.</b></p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-27%20%C2%B7%20zsh%205.9-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS 27 · zsh 5.9" />
  <img src="https://img.shields.io/badge/bash-3.2%2B-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" alt="bash 3.2+" />
  <img src="https://img.shields.io/badge/Ruby-3.4%20%C2%B7%20specs-CC342D?style=for-the-badge&logo=ruby&logoColor=white" alt="Ruby 3.4 · specs" />
  <img src="https://img.shields.io/badge/Tests-RSpec-4C9A2A?style=for-the-badge&logo=rubygems&logoColor=white" alt="Tests RSpec" />
</p>

<p align="center">
  <a href="https://github.com/lawrence-berry/setup-shell/actions/workflows/macos.yml"><img src="https://img.shields.io/github/actions/workflow/status/lawrence-berry/setup-shell/macos.yml?branch=main&style=for-the-badge&logo=apple&logoColor=white&label=macOS%2015" alt="macOS 15 CI status" /></a>
  <a href="https://github.com/lawrence-berry/setup-shell/actions/workflows/linux.yml"><img src="https://img.shields.io/github/actions/workflow/status/lawrence-berry/setup-shell/linux.yml?branch=main&style=for-the-badge&logo=ubuntu&logoColor=white&label=Ubuntu%2024.04" alt="Ubuntu 24.04 CI status" /></a>
</p>

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

Part of the [`setup-*`](https://lawrence-berry.github.io/setup) family; on a blank machine, `curl -fsSL https://lawrence-berry.github.io/setup | sh` installs them all (setup-mac and setup-iterm on macOS only).

# setup-shell

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

RSpec installs into `vendor/bundle` inside this repo. Never install gems into the system Ruby (`/usr/bin/ruby`): no `sudo gem install`, no system-wide bundle. When `setup-mac` installs a version-managed Ruby, use that one instead.

## TODO

- [ ] Tidy up `~/Projects/util`. Go through each folder: anything that's only notes moves to `~/Notes`, one file per repo. Working code moves into the `setup-*` repos.
  - [ ] aliasify
  - [ ] bash_helpers
  - [ ] colour_pallette
  - [ ] fire_stick_helpers
  - [ ] geo_me-makefile
  - [ ] mac_helpers
  - [ ] new_repo
  - [ ] pi_utils
  - [ ] random-stylesheets
  - [ ] rb_swap
  - [ ] repo_sync
  - [ ] ruby_helpers
  - [ ] svotd
  - [ ] terminal_aliases (essentials, git, linux, mac, locations and networking done; still to do: the rest of `fish/aliases.sh` one section per file, local aliases file, gitconfig, SSH config, Ruby/pry config, Linux server one-liner)
  - [ ] vim_config
  - [ ] virtualisation_helpers
  - [ ] vpn_helpers
- [ ] Install `nmap`, probably as part of the brew setup. The `alllocalips` alias in `aliases/networking.sh` needs it.
- [ ] GitHub setup: install the GitHub CLI (`gh`) and run `gh auth login`. The `wgd` alias in `aliases/git.sh` needs it.

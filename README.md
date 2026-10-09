# setup-shell

Shell aliases that work in both zsh on macOS and bash on Linux. Each group of aliases has its own file in `aliases/`, and every file there is loaded automatically. The exceptions are `aliases/mac.sh` and `aliases/linux.sh`: `install.sh` loads only the one for the platform it runs on.

## Install

```sh
./install.sh
```

This adds one line that loads every `aliases/*.sh` file to your login shell's config file: `~/.zshrc` if your shell is zsh, otherwise `~/.bashrc`. Running it again changes nothing, and if an older setup-shell line is there (for example after moving the repo), it is replaced.

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
- [ ] GitHub setup: install the GitHub CLI (`gh`) and run `gh auth login`. The `wgd` alias in `aliases/git.sh` needs it.

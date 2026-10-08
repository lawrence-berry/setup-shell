# setup-shell

Shell aliases that work in both zsh on macOS and bash on Linux.

## Install

```sh
./install.sh
```

This adds one line that sources `essentials.sh` to your login shell's config file: `~/.zshrc` if your shell is zsh, otherwise `~/.bashrc`. Running it again changes nothing.

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
  - [ ] terminal_aliases (essentials done; still to do: local aliases file, gitconfig, SSH config, Ruby/pry config, Linux server one-liner)
  - [ ] vim_config
  - [ ] virtualisation_helpers
  - [ ] vpn_helpers

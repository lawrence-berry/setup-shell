<p align="center"><img src="public/icon.png" alt="setup-shell icon" width="128" height="128"></p>

<h1 align="center">setup-shell</h1>

<p align="center"><b>Shell aliases that load the same way in zsh on macOS and bash on Linux, one file per group.</b></p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-27-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS 27" />
  <img src="https://img.shields.io/badge/Linux-Ubuntu%2024.04-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Linux Ubuntu 24.04" />
  <img src="https://img.shields.io/badge/Shell-zsh%20%C2%B7%20bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" alt="Shell zsh · bash" />
  <img src="https://img.shields.io/badge/Tests-RSpec-4C9A2A?style=for-the-badge&logo=rubygems&logoColor=white" alt="Tests RSpec" />
</p>

<p align="center">
  <a href="https://github.com/lawrence-berry/setup-shell/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/lawrence-berry/setup-shell/ci.yml?branch=main&style=for-the-badge&logo=githubactions&logoColor=white&label=CI" alt="CI status" /></a>
</p>

Shell aliases that work in both zsh on macOS and bash on Linux. Each group of aliases has its own file in `aliases/`, and every file there is loaded automatically. Platform-only aliases go in `aliases/Darwin/` (macOS) or `aliases/Linux/`, named after what `uname -s` prints, and only the current platform's folder is loaded.

## Supported versions

| Component | Version | Status |
|---|---|---|
| macOS | 27 (Apple Silicon), zsh 5.9 | Used daily |
| macOS | 15 | CI |
| Ubuntu | 24.04, bash | CI |
| zsh / bash | zsh 5.x; bash 3.2 (macOS) and later | Specs install into both, with `uname` faked for either platform |
| Ruby (specs only) | 3.4 | CI |

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

Part of the [`setup-*`](https://lawrence-berry.github.io/setup) family; on a blank machine, `curl -fsSL https://lawrence-berry.github.io/setup | sh` installs them all (setup-mac and setup-iterm on macOS only).

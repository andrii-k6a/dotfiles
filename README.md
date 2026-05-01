# dotfiles

Personal dotfiles for a macOS development setup built around Ghostty, tmux, Neovim, and Pi.

## Stack

- **Terminal:** Ghostty
- **Shell:** zsh + Oh My Zsh
- **Prompt and navigation:** Starship, fzf, zoxide, zsh-autosuggestions
- **Multiplexing:** tmux with auto-attach bootstrap and a custom `tmx` session switcher
- **Editors:** Neovim, IdeaVim
- **Coding agents:** Pi, opencode
- **Runtime managers:** fnm, pyenv, Bun, SDKMAN!
- **CLI tools:** ripgrep, fd, bat, lsd, jq, GitHub CLI, Terraform, rtk, hf, llama.cpp
- **Fonts:** Nerd Fonts (`FiraCode Nerd Font`, `Meslo LG Nerd Font`, `Victor Mono Nerd Font`)

## Repository layout

- `zsh/` — shell config, aliases, completions, tool initialization
- `tmux/` — tmux config, bootstrap script, `tmx` session helper
- `ghostty/` — terminal config
- `starship/` — prompt config
- `git/` — git config template, aliases, helper scripts
- `idea/` — IdeaVim config
- `pi/` — Pi package with skills, themes, and package installer
- `ssh/` — SSH setup notes and config template
- `Brewfile` — curated Homebrew bundle for this setup

## Setup

Install Homebrew-managed dependencies:

```sh
brew bundle --file=./Brewfile
```

Then link the configs you want:

```sh
(cd zsh && ./symlink.sh)
(cd tmux && ./symlink.sh)
(cd ghostty && ./symlink.sh)
(cd starship && ./symlink.sh)
(cd git && ./symlink.sh)
(cd idea && ./symlink.sh)
```

Install Pi package resources:

```sh
(cd pi && ./install.sh)
```

## Notes

- `git/symlink.sh` generates `git/.gitconfig` from `git/.gitconfig.template`.
  - It reads `GIT_USER_NAME` and `GIT_USER_EMAIL` from `../.env` if present.
  - Otherwise it prompts interactively.
- Local machine-specific shell overrides can live in `~/.zshrc.local`.
- SSH setup is documented in [`ssh/README.md`](./ssh/README.md).
- Some tools in this setup may be installed outside Homebrew. The `Brewfile` focuses on the Homebrew-managed part of the setup.
- Fonts come from [Nerd Fonts](https://www.nerdfonts.com/) / [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts). `FiraCode Nerd Font`, `Meslo LG Nerd Font`, and `Victor Mono Nerd Font` are included in the `Brewfile`.
- Ghostty is configured to use `VictorMono` for italic text.
- The `Brewfile` is curated for this repo and is not a full machine dump.

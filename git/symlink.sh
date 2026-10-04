#!/usr/bin/env bash
set -e

# NOTE: '~/.local/bin' must be on PATH (see .zshrc)
mkdir -p ~/.local/bin
rm -f ~/.local/bin/better-branch
chmod +x better-branch
ln -s "$(pwd)/better-branch" ~/.local/bin/better-branch


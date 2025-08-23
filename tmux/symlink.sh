#!/usr/bin/env bash

rm -f ~/.tmux.conf
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

# NOTE: '~/.local/bin' must be on PATH (see .zshrc)
mkdir -p ~/.local/bin
rm -f ~/.local/bin/tmx
chmod +x tmx
ln -s $(pwd)/tmx ~/.local/bin/tmx

rm -f ~/tmux-bootstrap.sh
ln -s $(pwd)/tmux-bootstrap.sh ~/tmux-bootstrap.sh

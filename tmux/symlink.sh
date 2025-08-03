#!/usr/bin/env bash

rm -f ~/.tmux.conf
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

# NOTE: '~/bin' must be on PATH 
rm -f ~/bin/tmx
chmod +x tmx
ln -s $(pwd)/tmx ~/bin/tmx

rm -f ~/tmux-bootstrap.sh
ln -s $(pwd)/tmux-bootstrap.sh ~/tmux-bootstrap.sh

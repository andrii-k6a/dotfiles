#!/usr/bin/env bash

rm -f ~/.config/ghostty/config
mkdir -p ~/.config/ghostty
ln -s $(pwd)/config ~/.config/ghostty/config

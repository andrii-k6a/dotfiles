#!/usr/bin/env bash

rm -rf ~/.config/ghostty/config
mkdir -p ~/.config/ghostty
ln -s $(pwd)/config ~/.config/ghostty/config

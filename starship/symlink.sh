#!/usr/bin/env bash

mkdir -p ~/.config
rm -f ~/.config/starship.toml
ln -s $(pwd)/starship.toml ~/.config/starship.toml


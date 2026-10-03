#!/usr/bin/env bash

rm -f ~/aliases.sh
ln -s $(pwd)/aliases.sh ~/aliases.sh

# Backup .zshrc if exists and not the same
if [ -f ~/.zshrc ] && ! cmp -s ~/.zshrc "$(pwd)/.zshrc"; then
  cp ~/.zshrc ~/.zshrc.bak.$(date +%Y%m%d%H%M%S)
fi
rm -f ~/.zshrc
ln -s $(pwd)/.zshrc ~/.zshrc

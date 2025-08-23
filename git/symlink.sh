#!/usr/bin/env bash

# NOTE: '~/.local/bin' must be on PATH (see .zshrc)
mkdir -p ~/.local/bin
rm -f ~/.local/bin/better-branch
chmod +x better-branch
ln -s $(pwd)/better-branch ~/.local/bin/better-branch

# Try to read git user/email from .env file first (in root directory)
if [[ -f "../.env" ]]; then
    source "../.env"
fi

# Prompt for input if not set from .env
if [[ -z "$GIT_USER_NAME" ]]; then
    read -p "Enter Git user name: " GIT_USER_NAME
fi

if [[ -z "$GIT_USER_EMAIL" ]]; then
    read -p "Enter Git user email: " GIT_USER_EMAIL
fi

# Export variables for envsubst
export GIT_USER_NAME
export GIT_USER_EMAIL

# Generate the actual .gitconfig from template
envsubst < ".gitconfig.template" > ".gitconfig"

rm -f ~/.gitconfig
ln -s $(pwd)/.gitconfig ~/.gitconfig


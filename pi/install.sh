#!/usr/bin/env bash

packages=(
  "$(cd "$(dirname "$0")" && pwd)"
  "git:github.com/andrii-k6a/pi-head"
)

for p in "${packages[@]}"; do
  pi install "$p"
done

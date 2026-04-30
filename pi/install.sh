#!/usr/bin/env bash

packages=(
  "$(cd "$(dirname "$0")" && pwd)"
  "git:github.com/andrii-k6a/pi-draw"
  "git:github.com/andrii-k6a/pi-head"
  "git:github.com/andrii-k6a/pi-nocchio"
)

for p in "${packages[@]}"; do
  pi install "$p"
done

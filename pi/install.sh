#!/usr/bin/env bash
set -euo pipefail

pi_dir="$(cd "$(dirname "$0")" && pwd)"
agent_dir="${HOME}/.pi/agent"

mkdir -p "$agent_dir"

# Install the global agent context managed by this repo; may replace an existing one.
echo "Installing Pi AGENTS.md -> $agent_dir/AGENTS.md"
ln -sfn "$pi_dir/global-agent-context.md" "$agent_dir/AGENTS.md"

packages=(
  "git:github.com/andrii-k6a/pi-packages"
)

for p in "${packages[@]}"; do
  pi install "$p"
done

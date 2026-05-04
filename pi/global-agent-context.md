Personal context. Use it only when it is relevant to the current task.

- Reference boundaries:
  - Do not inspect personal custom configuration for unrelated tasks.
  - Treat personal configuration repos as read-only unless either:
    - the current working directory is the relevant repo, or
    - I explicitly ask you to edit them.

- Dotfiles configuration reference:
  - The dotfiles repo is the source of truth for personal custom setup: shell, terminal, multiplexer, Git, other tooling configuration.
  - Consult it only when the current task depends on one of these areas:
    - Shell: zsh / OhMyZsh, aliases, completions, and tool initialization.
    - Terminal: Ghostty configuration.
    - Multiplexer: tmux, auto-attach bootstrap, and the `tmx` session switcher.
    - Git: config, aliases, helper scripts, and SSH setup.
  - To locate the repo, resolve the Pi agent context symlink instead of assuming an absolute path:
    ```bash
    cd "$(dirname "$(readlink ~/.pi/agent/AGENTS.md)")/.." && pwd
    ```

- Neovim configuration reference:
  - Active Neovim config is the source of truth for Neovim-related tasks: editor setup, keymaps, plugins, LSP, formatting, and other Neovim behavior.
  - Consult it only when the current task depends on my editor setup.
  - To locate the active config, resolve the Neovim config symlink instead of assuming an absolute path:
    ```bash
    readlink ~/.config/nvim
    ```

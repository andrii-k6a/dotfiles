# Pi

Pi coding agent configuration: package installer and global agent context.

## Setup

```sh
(cd pi && ./install.sh)
```

Sets up the global agent context and installs all Pi packages. Re-running is safe; unpinned packages may upgrade.

## Global agent context

`global-agent-context.md` contains lightweight personal context shared with every Pi session, such as editor, shell, terminal, Git, and Pi setup notes. Keep it concise and broadly useful.

## Adding a package

Append it to the `packages` array in `install.sh`. Pin with `@<ref>` (e.g. `git:github.com/user/repo@v1`) for reproducibility.

## Skills, prompts, extensions, and themes

Managed in [andrii-k6a/pi-packages](https://github.com/andrii-k6a/pi-packages).

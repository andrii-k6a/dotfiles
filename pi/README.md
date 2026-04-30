# Pi

Pi coding agent configuration: skills, themes, and a package installer.

This directory is itself a Pi package, so `skills/` and `themes/` load directly from the repo — no copying or symlinking.

## Setup

```sh
(cd pi && ./install.sh)
```

Registers this directory as a local Pi package and installs the third-party packages listed in `install.sh`. Re-running is safe; unpinned packages may upgrade.

## Adding a skill or theme

Drop it under `skills/<name>/SKILL.md` or `themes/<name>.json` and commit. Pi picks it up on next start (or `/reload`).
Skill catalogs and collections for inspiration:

- [skills.sh](https://skills.sh/) — searchable index of community skills
- [anthropics/skills](https://github.com/anthropics/skills) — official Anthropic skills (docx, pdf, pptx, xlsx, web dev)
- [openai/skills](https://github.com/openai/skills) — official OpenAI skills
- [obra/superpowers](https://github.com/obra/superpowers) — Jesse Vincent's curated skill pack

## Adding a third-party package

Append to the `packages` array in `install.sh`. Pin with `@<ref>` (e.g. `git:github.com/user/repo@v1`) for reproducibility.

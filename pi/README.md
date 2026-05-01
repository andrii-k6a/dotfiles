# Pi

Pi coding agent configuration: package installer, skills, prompts, and themes.

This directory is itself a Pi package, so `skills/`, `prompts/`, and `themes/` load directly from the repo — no copying or symlinking.

## Setup

```sh
(cd pi && ./install.sh)
```

Registers this directory as a local Pi package and installs the third-party packages listed in `install.sh`. Re-running is safe; unpinned packages may upgrade.

## Adding a third-party package

Append it to the `packages` array in `install.sh`. Pin with `@<ref>` (e.g. `git:github.com/user/repo@v1`) for reproducibility.

## Adding a skill

Drop it under `skills/<name>/SKILL.md` and commit. Pi picks it up on next start (or `/reload`).

Skill catalogs and collections for inspiration:

- [skills.sh](https://skills.sh/) — searchable index of community skills
- [anthropics/skills](https://github.com/anthropics/skills) — official Anthropic skills (docx, pdf, pptx, xlsx, web dev)
- [openai/skills](https://github.com/openai/skills) — official OpenAI skills
- [obra/superpowers](https://github.com/obra/superpowers) — Jesse Vincent's curated skill pack
- [contains-studio/agents](https://github.com/contains-studio/agents) — Contains Studio's collection of agents
- [mattpocock/skills](https://github.com/mattpocock/skills) — Matt Pocock's skills collection

## Adding a prompt

Drop it under `prompts/<name>.md` and commit. Pi exposes it as `/<name>` on next start (or `/reload`).

## Adding a theme

Drop it under `themes/<name>.json` and commit. Pi picks it up on next start (or `/reload`).


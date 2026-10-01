# AGENTS.md

## Rules
- Do not commit, push, or amend unless I explicitly ask in that message. Approving a plan is not permission to commit.
- Keep changes minimal. Only touch what the task needs.
- Don't reformat, rename, or "clean up" code you weren't asked to change.
- Ask before deleting files or changing anything outside this repo (like files in `~`).

## Layout
- `zshrc`: shared zsh config. OS-specific settings go in `zsh/os/darwin.zsh` or `zsh/os/linux.zsh`, not in `zshrc`.
- `quickstart.sh`: symlinks configs into place. If you add a config file, add it here and to `README.md`.

## Checking changes
- `zsh -n zshrc zsh/os/*.zsh zshenv`
- `bash -n quickstart.sh`

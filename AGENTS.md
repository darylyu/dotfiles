# AGENTS.md

Follow the rules in `agents_global.md`.

## Layout
- `zshrc`: shared zsh config. OS-specific settings go in `zsh/os/darwin.zsh` or `zsh/os/linux.zsh`, not in `zshrc`.
- `quickstart.sh`: symlinks configs into place. If you add a config file, add it here and to `README.md`.

## Checking changes
- `zsh -n zshrc zsh/os/*.zsh zshenv`
- `bash -n quickstart.sh`

dotfiles
========

Run `./quickstart.sh` to symlink everything into place. It detects macOS vs Linux.

Shared
- astrovim/ - config for AstroVim neovim distribution (`~/.config/astrovim`)
- gitconfig - global git configuration
- gitignore_global - list of files that git ignores in all repositories
- lazyvim/ - config for LazyVim neovim distribution (`~/.config/lazyvim`)
- tigrc - tig configuration
- tmux.conf - tmux configuration
- vimrc - vim configuration
- zshrc - zsh config shared by all OSes; defers most things to oh-my-zsh
- zshenv - sources rustup's cargo env
- zsh/os/darwin.zsh, zsh/os/linux.zsh - OS-specific zsh settings, sourced by zshrc
- zsh/themes/dyu.zsh-theme - oh-my-zsh theme (zshrc sets `ZSH_CUSTOM` to zsh/)

macOS
- obinskit_kb_layout.json - ObinsKit keyboard layout

Linux
- i3_config, i3status.conf - i3 window manager and status bar
- sway_config - sway window manager
- foot.ini - foot terminal
- x11-40-libinput.conf - copy to /etc/X11/xorg.conf.d/40-libinput.conf

License

-------
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

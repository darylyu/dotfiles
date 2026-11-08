dotfiles
========

Run `./quickstart.sh` to symlink everything into place. It detects macOS vs Linux.

Shared
- agents_global.md - rules for coding agents (`~/.claude/CLAUDE.md`, `~/.copilot/copilot-instructions.md`)
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
- i3_config - i3 window manager
  - needs `autorandr` to switch screen layouts on hotplug; save layouts with `autorandr --save <name>`
- i3_osd.sh - volume and brightness pop-ups for the i3 media keys
- i3_lang.sh - shows and switches the IBus input method, for the i3 bar and `$mod+i`
- picom.conf - picom compositor for i3 (shadows, fades, rounded corners)
- i3blocks.conf - i3 status bar blocks; scripts come from i3blocks-contrib, which quickstart.sh clones
- kitty.conf - kitty terminal, opened by i3
- dunstrc - dunst notifications
- rofi_power_menu.sh - rofi power menu, opened by `$mod+Shift+e`
- gsimplecal_config - small calendar, opened by clicking the date in the i3 bar (needs `gsimplecal`)
- needs `hsetroot` for the i3 background colour
- volumeicon.conf - volume icon in the i3 tray (needs `volumeicon-alsa`)
- sway_config - sway window manager
- foot.ini - foot terminal
- x11-40-libinput.conf - copy to /etc/X11/xorg.conf.d/40-libinput.conf
- logind-lid.conf - copy to /etc/systemd/logind.conf.d/lid.conf: closing the lid on battery sleeps, then hibernates
- sleep-hibernate.conf - copy to /etc/systemd/sleep.conf.d/hibernate.conf: hibernate after 2 hours asleep

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

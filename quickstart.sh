#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# link SRC DST: symlink $DOTFILES/SRC to DST, replacing whatever is there.
link() {
    echo "Creating symlink $2 -> $DOTFILES/$1"
    mkdir -p "$(dirname "$2")"
    ln -sfn "$DOTFILES/$1" "$2"
}

# Shared
link gitconfig ~/.gitconfig
link gitignore_global ~/.gitignore_global
link tmux.conf ~/.tmux.conf
link vimrc ~/.vimrc
link tigrc ~/.tigrc
link astrovim ~/.config/astrovim
link lazyvim ~/.config/lazyvim
link agents_global.md ~/.claude/CLAUDE.md
link agents_global.md ~/.copilot/copilot-instructions.md

if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# zshrc points oh-my-zsh's $ZSH_CUSTOM at zsh/ in this repo, so the theme needs no symlink.
link zshrc ~/.zshrc
link zshenv ~/.zshenv

# OS-specific
case "$(uname)" in
    Linux)
        link i3_config ~/.config/i3/config
        link i3_osd.sh ~/.config/i3/osd.sh
        link i3_lang.sh ~/.config/i3/lang.sh
        link picom.conf ~/.config/picom/picom.conf
        link kitty.conf ~/.config/kitty/kitty.conf
        link dunstrc ~/.config/dunst/dunstrc
        link rofi_power_menu.sh ~/.config/rofi/power-menu.sh
        link gsimplecal_config ~/.config/gsimplecal/config
        link volumeicon.conf ~/.config/volumeicon/volumeicon
        if [ ! -d ~/.config/i3blocks/.git ]; then
            echo "Cloning https://github.com/vivien/i3blocks-contrib"
            git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks
        fi
        link i3blocks.conf ~/.config/i3blocks/config
        link sway_config ~/.config/sway/config
        link foot.ini ~/.config/foot/foot.ini
        echo "To configure libinput under X11, run:"
        echo "  sudo cp $DOTFILES/x11-40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf"
        echo "To sleep, then hibernate, when the laptop lid closes on battery, run:"
        echo "  sudo mkdir -p /etc/systemd/logind.conf.d /etc/systemd/sleep.conf.d"
        echo "  sudo cp $DOTFILES/logind-lid.conf /etc/systemd/logind.conf.d/lid.conf"
        echo "  sudo cp $DOTFILES/sleep-hibernate.conf /etc/systemd/sleep.conf.d/hibernate.conf"
        echo "  sudo systemctl kill -s HUP systemd-logind"
        ;;
esac

if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Cloning https://github.com/tmux-plugins/tpm"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "Open tmux and run C-a I to install the tmux plugins"

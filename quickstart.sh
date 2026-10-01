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
        link i3status.conf ~/.config/i3status/config
        link sway_config ~/.config/sway/config
        link foot.ini ~/.config/foot/foot.ini
        echo "To configure libinput under X11, run:"
        echo "  sudo cp $DOTFILES/x11-40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf"
        ;;
esac

if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Cloning https://github.com/tmux-plugins/tpm"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "Open tmux and run C-a I to install the tmux plugins"

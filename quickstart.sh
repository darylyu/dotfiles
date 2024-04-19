#!/usr/bin/env bash
echo $PWD
echo "Creating symlink: ~/.gitconfig"
ln -s -F $PWD/gitconfig ~/.gitconfig

echo "Creating symlink ~/.gitignore_global"
ln -s -F $PWD/gitignore_global ~/.gitignore_global

echo "Creating symlink ~/.tmux.conf"
ln -s -F $PWD/tmux.conf ~/.tmux.conf

echo "Creating symlink ~/.vimrc"
ln -s -F $PWD/vimrc ~/.vimrc

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Creating symlink ~/.oh-my-zsh/themes/dyu.zsh-theme"
ln -s -F $PWD/dyu.zsh-theme ~/.oh-my-zsh/themes/dyu.zsh-theme

echo "Creating symlink ~/.zshrc"
ln -s -F $PWD/zshrc ~/.zshrc

echo "Cloning https://github.com/tmux-plugins/tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Open tmux and run C-a I to install the tmux plugins"

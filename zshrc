# Resolve the dotfiles repo from this file's real location (~/.zshrc is a symlink)
DOTFILES=${${(%):-%x}:A:h}

# goodbye, missing locale warnings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# oh-my-zsh: themes are loaded from $ZSH_CUSTOM/themes (zsh/themes/ in this repo)
export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$DOTFILES/zsh
ZSH_THEME="dyu"
plugins=(vi-mode git python)

source $ZSH/oh-my-zsh.sh

# Shell aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias lsvirtualenv="lsvirtualenv -b"

brgrep() {
    git branch | grep "$@"
}

hgrep() {
    history | grep "$@"
}

gtfo() {
    git fetch origin && git rebase origin/$1
}

# neovim aliases
alias astrovim="NVIM_APPNAME=astrovim nvim"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"

function reactivate() {
    # jdx/mise has a bug where it unsets $VIRTUAL_ENV - 2024-10-21
    # Adding this as a work-around for now.
    # Get the name of the current virtualenv
    current_env=$VIRTUAL_ENV_PROMPT
    # Deactivate the current virtualenv
    deactivate 2>/dev/null
    # Reactivate the virtualenv using workon
    workon "$current_env"
}

# don't include vim swap files, compiled python files, and binary files when using grep
# (GREP_OPTIONS is deprecated, so this is an alias instead)
() {
    local -a opts=(
        --color=auto -I
        --exclude='*.pyc' --exclude='*.swp' --exclude='*.po'
        --exclude=tags --exclude=.coverage
        --exclude-dir=.git --exclude-dir=.idea --exclude-dir=.mypy_cache
        --exclude-dir=htmlcov --exclude-dir=bower_components
        --exclude-dir=node_modules --exclude-dir=build
    )
    alias grep="grep ${(j: :)${(q)opts[@]}}"
}

# Prepend a directory to $path only if it exists. Used here and in zsh/os/*.zsh.
_path_prepend_if_dir() {
    [[ -d $1 ]] && path=($1 $path)
}

# Shared PATH. -U keeps entries unique (first occurrence wins).
typeset -U path
path=(/usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin $path)
path=($HOME/bin $HOME/.local/bin $path)
path+=(node_modules/.bin)
_path_prepend_if_dir $HOME/.config/yarn/global/node_modules/.bin
_path_prepend_if_dir $HOME/.yarn/bin

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
         find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# OS-specific settings. Sourced after the shared PATH so OS paths take precedence.
case $OSTYPE in
    darwin*) source $DOTFILES/zsh/os/darwin.zsh ;;
    linux*)  source $DOTFILES/zsh/os/linux.zsh ;;
esac

export PIP_REQUIRE_VIRTUALENV=true

[[ -f ~/.ssh_aliases ]] && source ~/.ssh_aliases

# Don't auto-activate mise because it unsets the virtualenv when changing dirs
# eval "$($HOME/.local/bin/mise activate zsh)"

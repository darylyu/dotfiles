# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dyu"

# goodbye, missing locale warnings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Shell aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias hgrep="history | grep $1"
alias lsvirtualenv="lsvirtualenv -b"

if [[ `uname` == 'Darwin' ]]; then
    alias find="gfind"
    export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/python@3.10/lib -L/opt/homebrew/opt/icu4c/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/icu4c/include"
fi

alias fixvirtualenv="find ~/.virtualenvs/$1/ -type l -xtype l -delete && deactivate ; virtualenv --python=python2.7 ~/.virtualenvs/$1 && workon $1"

[ -f ~/.ssh_aliases ] && source ~/.ssh_aliases

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode git python nvm)

zstyle ':omz:alpha:lib:git' async-prompt no
source $ZSH/oh-my-zsh.sh

# don't include vim swap files, compiled python files, and binary files when using grep
GREP_OPTIONS='--color=auto --exclude=\.pyc --exclude-dir=.git --exclude=\.swp -I --exclude=tags --exclude-dir=htmlcov --exclude-dir=bower_components --exclude-dir=node_modules --exclude-dir=build --exclude=.coverage --exclude-dir=.idea --exclude=\*\.po'

# GREP_OPTIONS is deprecated - using an alias instead.
alias grep="grep $GREP_OPTIONS"

# Customize to your needs...
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
PATH="$HOME/bin:$HOME/.local/bin:$HOME/.pyenv/shims:/usr/local/opt/python/libexec/bin:$PATH"

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
         find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

PATH=${PATH}:node_modules/.bin

PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
    export ANDROID_SDK="$HOME/Library/Android/sdk"
    PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
    PATH=/opt/homebrew/bin:$PATH
    PATH=/opt/homebrew/opt/python@3.10/bin:$PATH
    PATH=/opt/homebrew/opt/postgresql@11/bin:$PATH
    PATH=$HOME/.docker/bin:$PATH
    export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/opt/python@3.10/bin/python3.10
else
    export ANDROID_SDK="$HOME/Android/Sdk"
fi

export PATH

# Instead of checking for the OS here, just make sure that virtualenvwrapper is already installed.
# In MacOS: it will be in /opt/homebrew/bin/virtualenvwrapper_lazy.sh
# In Ubuntu: it will be in /usr/local/bin/virtualenvwrapper_lazy.sh
# In Debian: it will be in /usr/share/virtualenvwrapper_lazy.sh
source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
export PIP_REQUIRE_VIRTUALENV=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use lazy loading for nvm - START
# It was adding a noticeable delay to a new shell session's startup
# http://broken-by.me/lazy-load-nvm/
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}
# Use lazy loading for nvm - END


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

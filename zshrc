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
    export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/python@3.8/lib -L/opt/homebrew/opt/icu4c/lib"
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
plugins=(vi-mode git python django nvm)

source $ZSH/oh-my-zsh.sh

# don't include vim swap files, compiled python files, and binary files when using grep
GREP_OPTIONS='--color=auto --exclude=\.pyc --exclude-dir=.git --exclude=\.swp -I --exclude=tags --exclude-dir=htmlcov --exclude-dir=bower_components --exclude-dir=node_modules --exclude-dir=build --exclude=.coverage --exclude=\*\.po'

# GREP_OPTIONS is deprecated - using an alias instead.
alias grep="grep $GREP_OPTIONS"

# Customize to your needs...
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
PATH="$HOME/bin:$HOME/.local/bin:/usr/local/opt/python/libexec/bin:$PATH"

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
         find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
PATH=${PATH}:node_modules/.bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# OPAM(ocaml package manager) configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
    PATH=/opt/homebrew/opt/python@3.8/bin:$HOME/Library/Python/3.8/bin:$PATH
    PATH=/opt/homebrew/opt/postgresql@11/bin:$PATH
    export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/opt/python@3.8/bin/python3.8
fi

export PATH

# Instead of checking for the OS here, just make sure that virtualenvwrapper is already installed.
# In MacOS: it will be in ~/Library/Python/3.8/bin/virtualenvwrapper_lazy.sh
# In Ubuntu: it will be in /usr/local/bin/virtualenvwrapper_lazy.sh
source virtualenvwrapper_lazy.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

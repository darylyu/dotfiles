# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# goodbye, missing locale warnings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Shell aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias hgrep="history | grep $1"
alias lsvirtualenv="lsvirtualenv -b"

source ~/.ssh_aliases

function reactivate {
    TMP_VENV=( $(echo $VIRTUAL_ENV | gawk -F '/' '{print $NF}')) && \
    deactivate && \
    workon $TMP_VENV
}

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
plugins=(vi-mode git python django)

source $ZSH/oh-my-zsh.sh

# don't include vim swap files, compiled python files, and binary files when using grep
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git --exclude=*.swp -I --exclude=tags --exclude-dir=htmlcov --exclude-dir=bower_components --exclude-dir=node_modules --exclude-dir=build'

# Customize to your needs...
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
PATH=~/Library/Python/2.7/bin:$PATH
export PATH="~/bin:~/.local/bin:$PATH"

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
         find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

source /usr/local/bin/virtualenvwrapper_lazy.sh

export PATH=${PATH}:node_modules/.bin

export NVM_DIR="/Users/dyu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

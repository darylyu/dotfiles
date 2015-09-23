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
alias grep="grep --color=always"
alias hgrep="history | grep $1"
alias lsvirtualenv="lsvirtualenv -b"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Steal C-s and C-q from the terminal.
# We need this so we can do splits in Command-T
stty start undef stop undef

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:/home/dyu/.cabal/bin:$PATH"

# Read ~/.pythonrc
export PYTHONSTARTUP=~/.pythonrc
export PYTHONPATH=/Library/Python/2.7/site-packages/:$PYTHONPATH

# rbenv
export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

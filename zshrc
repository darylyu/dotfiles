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

if [[ `uname` == 'Darwin' ]]; then
    alias find="gfind"
    export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib -L$HOME/.local/share/mise/installs/python/3.10/lib -L/opt/homebrew/opt/icu4c/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/icu4c/include"
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

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
plugins=(vi-mode git python)

zstyle ':omz:alpha:lib:git' async-prompt no
source $ZSH/oh-my-zsh.sh

# don't include vim swap files, compiled python files, and binary files when using grep
GREP_OPTIONS='--color=auto --exclude=\.pyc --exclude-dir=.git --exclude=\.swp -I --exclude=tags --exclude-dir=htmlcov --exclude-dir=bower_components --exclude-dir=node_modules --exclude-dir=build --exclude=.coverage --exclude-dir=.idea --exclude=\*\.po --exclude-dir=.mypy_cache'

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

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"


# if [[ `uname` == 'Darwin' ]]; then
#     eval "$(fzf --zsh)"
# fi


PATH=${PATH}:node_modules/.bin

PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
    export ANDROID_SDK="$HOME/Library/Android/sdk"
    PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
    PATH=/opt/homebrew/bin:$PATH
    PATH=/opt/homebrew/opt/python@3.10/bin:$PATH
    PATH=/opt/homebrew/opt/postgresql@15/bin:$PATH
    PATH=$HOME/.docker/bin:$PATH
    export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/opt/python@3.10/bin/python3.10
else
    export ANDROID_SDK="$HOME/Android/Sdk"
fi

export PATH

# Run virtualenvwrapper_lazy.sh
# In MacOS: it will be in /opt/homebrew/bin/virtualenvwrapper_lazy.sh
# In Ubuntu: it will be in /usr/local/bin/virtualenvwrapper_lazy.sh
# In Debian: it will be in /usr/share/virtualenvwrapper_lazy.sh
if [[ `uname` == 'Darwin' ]]; then
    source virtualenvwrapper_lazy.sh
else
    source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
fi
export PIP_REQUIRE_VIRTUALENV=true

eval "$($HOME/.local/bin/mise activate zsh)"

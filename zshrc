# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rm="rm -i"
alias grep="grep --color=always"
alias tomcat_start="/opt/tomcat/bin/startup.sh"

function _tomcat_kill {
    kill -9 `ps -eaf | grep -e "-Dcatalina.home=/opt/tomcat" | grep -v grep | gawk '{print $2}'`
}
alias tomcat_kill="_tomcat_kill"
alias tomcat_stop="/opt/tomcat/bin/shutdown.sh ; sleep 5; _tomcat_kill"

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

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:/home/dyu/.cabal/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/java-7-oracle"
export JAVA_OPTS="-XX:MaxPermSize=512m"
export MAVEN_OPTS=$JAVA_OPTS
export CATALINA_OPTS="$JAVA_OPTS -Dorg.ektorp.support.AutoUpdateViewOnChange=true"
export CATALINA_HOME=/opt/tomcat

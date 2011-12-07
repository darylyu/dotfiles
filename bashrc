# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias cp='cp -i'
alias ctags_omi='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'
alias hgrep='history | grep $1'
alias list_aliases='grep alias ~/.bashrc'
alias ls='ls --color=auto -F'
alias ll='ls -la'
alias mv='mv -i'
alias rm='rm -i'

# custom terminal prompt
PS1=''
PS1=$PS1'\[\e[0;32m\][ \u@\h ] '
PS1="$PS1[ \w ] "
# display the current git branch. if not a git directory, display nothing.
GIT_BRANCH='$(git branch 2>/dev/null|fgrep '\''*'\''|sed '\''s/.$/\0 /;s/^* //'\'')'
PS1="$PS1$GIT_BRANCH"
PS1="$PS1 \[\e[0m\] "
PS1="$PS1 \n----------> "
export PS1


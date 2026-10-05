ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}] "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

RPS1='%{$fg[red]%}%~%{$reset_color%} ${return_code}'

PROMPT='[%*] $(git_prompt_info)$%b '

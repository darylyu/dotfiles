# macOS-only settings. Sourced from zshrc.

export HOMEBREW_NO_AUTO_UPDATE=1

# Compiler flags for building native extensions against Homebrew/mise libraries
() {
    local -a ldflags cppflags
    local dir
    for dir in /opt/homebrew/opt/{openssl@1.1,icu4c}; do
        [[ -d $dir ]] || continue
        ldflags+=(-L$dir/lib)
        cppflags+=(-I$dir/include)
    done
    dir=$HOME/.local/share/mise/installs/python/3.11/lib
    [[ -d $dir ]] && ldflags+=(-L$dir)
    (( $#ldflags )) && export LDFLAGS="${ldflags[*]}"
    (( $#cppflags )) && export CPPFLAGS="${cppflags[*]}"
}

# Setting DYLD_FALLBACK_LIBRARY_PATH replaces dyld's default fallback list, so keep those too.
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib:${DYLD_FALLBACK_LIBRARY_PATH:-$HOME/lib:/usr/local/lib:/usr/lib}

_path_prepend_if_dir /usr/local/opt/python/libexec/bin

[[ -d $HOME/Library/Android/sdk ]] && export ANDROID_SDK=$HOME/Library/Android/sdk
_path_prepend_if_dir $HOME/Library/Android/sdk/platform-tools

_path_prepend_if_dir /opt/homebrew/bin
_path_prepend_if_dir /opt/homebrew/opt/python@3.11/bin
_path_prepend_if_dir /opt/homebrew/opt/postgresql@15/bin
_path_prepend_if_dir $HOME/.docker/bin

(( $+commands[gfind] )) && alias find="gfind"

# Without this, virtualenvwrapper uses python3 from $PATH
[[ -x /opt/homebrew/opt/python@3.10/bin/python3.10 ]] &&
    export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/opt/python@3.10/bin/python3.10

(( $+commands[virtualenvwrapper_lazy.sh] )) && source $commands[virtualenvwrapper_lazy.sh]

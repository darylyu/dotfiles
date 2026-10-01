# Linux-only settings. Sourced from zshrc.

[[ -d $HOME/Android/Sdk ]] && export ANDROID_SDK=$HOME/Android/Sdk

# Wayland: no client-side decorations
export GTK_CSD=0
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# virtualenvwrapper_lazy.sh lives in different places depending on the distro
() {
    local f
    for f in /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh \
             /usr/local/bin/virtualenvwrapper_lazy.sh \
             /usr/share/virtualenvwrapper_lazy.sh; do
        if [[ -f $f ]]; then
            source $f
            return
        fi
    done
}

#!/usr/bin/env sh
# Show or switch the IBus input method, for the i3 bar's lang block and $mod+i.
# Usage: i3_lang.sh          print the current input method ("en", "pinyin", ...)
#        i3_lang.sh toggle   switch to the next one in IBus's list

current=$(ibus engine)

if [ "$1" = toggle ]; then
    # preload-engines looks like ['xkb:us::eng', 'sunpinyin']
    engines=$(gsettings get org.freedesktop.ibus.general preload-engines | tr -d "[]',")
    first=""
    next=""
    found=""
    for e in $engines; do
        [ -z "$first" ] && first=$e
        if [ -n "$found" ]; then
            next=$e
            break
        fi
        [ "$e" = "$current" ] && found=1
    done
    ibus engine "${next:-$first}"
    exit
fi

case "$current" in
    xkb:us::*) echo en ;;
    sunpinyin) echo pinyin ;;
    *) echo "$current" ;;
esac

#!/usr/bin/env sh
# Lock sway the way i3lock-fancy does in i3: a blurred, darkened screenshot of each screen
# with a lock icon and "Type password to unlock". A gruvbox ring around the icon is always
# shown, turns orange as you type, and red on a wrong password.
# Used by sway_config (swayidle and $mod+Ctrl+q).

icon=/usr/share/i3lock-fancy/lock.png
font=$(fc-match -f '%{file}' 'FiraMono Nerd Font Propo')
dir=$(mktemp -d)
images=""

for output in $(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name'); do
    # PPM, not PNG: no compression, so this takes a fraction of a second, not seconds.
    img="$dir/$output.ppm"
    grim -t ppm -o "$output" "$img" || continue
    size=$(identify -format '%wx%h' "$img")
    [ -f "$icon" ] || icon=xc:none
    # Shrinking and growing back blurs much faster than -blur on a full-size image.
    convert "$img" -scale 10% -blur 0x2 -scale "$size!" -fill '#1d2021' -colorize 50% \
        "$icon" -gravity center -composite \
        -font "$font" -pointsize 24 -fill '#ebdbb2' -annotate +0+140 'Type password to unlock' \
        "$img"
    images="$images -i $output:$img"
done

# No screenshot (grim failed): plain gruvbox grey.
[ -n "$images" ] || images="-c 282828"

# shellcheck disable=SC2086
swaylock -f $images \
    --indicator-idle-visible --indicator-radius 70 --indicator-thickness 6 \
    --inside-color 00000000 --inside-clear-color 00000000 \
    --inside-ver-color 00000000 --inside-wrong-color 00000000 \
    --ring-color ebdbb2 --ring-clear-color ebdbb2 \
    --ring-ver-color d65d0e --ring-wrong-color cc241d \
    --key-hl-color d65d0e --bs-hl-color cc241d \
    --line-color 00000000 --line-clear-color 00000000 \
    --line-ver-color 00000000 --line-wrong-color 00000000 \
    --separator-color 00000000 \
    --text-color 00000000 --text-clear-color 00000000 \
    --text-ver-color 00000000 --text-wrong-color 00000000

# swaylock -f returns once the screen is locked and the images are loaded.
rm -rf "$dir"

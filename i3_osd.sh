#!/usr/bin/env sh
# Show the volume, mic or brightness level as a dunst pop-up with a bar.
# Called by the i3 media and brightness key bindings. Each kind replaces its last pop-up.
# Usage: i3_osd.sh volume|mic|brightness

case "$1" in
    volume)
        value=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -n 1 | tr -d %)
        if pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes; then
            text="Volume muted"
        else
            text="Volume $value%"
        fi
        ;;
    mic)
        if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q yes; then
            text="Mic muted"
        else
            text="Mic on"
        fi
        ;;
    brightness)
        value=$(brightnessctl -m | cut -d, -f4 | tr -d %)
        text="Brightness $value%"
        ;;
    *)
        echo "usage: $0 volume|mic|brightness" >&2
        exit 1
        ;;
esac

notify-send -a osd -u low -h "string:x-dunst-stack-tag:$1" ${value:+-h "int:value:$value"} "$text"

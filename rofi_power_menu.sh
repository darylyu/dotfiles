#!/usr/bin/env sh
# Power menu for i3, opened with $mod+Shift+e.

choice=$(printf '%s\n' \
    "󰌾  Lock" \
    "󰍃  Log out" \
    "󰤄  Suspend" \
    "󰜉  Reboot" \
    "󰐥  Shut down" |
    rofi -dmenu -i -no-custom -p Power)

case "$choice" in
    *Lock) loginctl lock-session ;;
    *"Log out") i3-msg exit ;;
    *Suspend) systemctl suspend ;;
    *Reboot) systemctl reboot ;;
    *"Shut down") systemctl poweroff ;;
esac

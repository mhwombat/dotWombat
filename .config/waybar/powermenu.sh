#!/usr/bin/env bash

op=$( echo -e "  Poweroff\n  Reboot\n  Suspend\n Hibernate\n  Lock\n  Logout" | fuzzel --dmenu | awk '{print tolower($2)}' )

case $op in
poweroff)
   ;&
reboot)
   ;&
hibernate)
   ;&
suspend)
   echo "systemctl $op"
   systemctl $op
   ;;
lock)
   hyprlock
   ;;
logout)
   hyprctl dispatch exit
   ;;
esac

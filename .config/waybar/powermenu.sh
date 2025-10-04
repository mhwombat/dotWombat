#!/usr/bin/env bash

op=$( echo -e "  Poweroff\n  Reboot\n  Suspend\n Hibernate\n  Lock\n  Logout" | fuzzel --dmenu | awk '{print tolower($2)}' )

echo $op
exit

case $op in
poweroff)
   systemctl poweroff
   ;;
reboot)
   systemctl reboot
   ;;
hibernate)
   systemctl hibernate
   ;;
suspend)
   systemctl suspend
   ;;
lock)
   : # not implemented
   ;;
logout)
   niri msg action quit
   ;;
esac

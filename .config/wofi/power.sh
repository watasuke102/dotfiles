#!/usr/bin/env bash
selected=$(echo -e "Logout\nShutdown\nReboot\nSuspend\nLock Screen" | wofi -i --dmenu)

case "$selected" in
  "Logout")
    hyprctl dispatch 'hl.dsp.exit()'
    ;;
  "Shutdown")
    systemctl poweroff
    ;;
  "Reboot")
    systemctl reboot
    ;;
  "Suspend")
    systemctl suspend
    ;;
  "Lock Screen")
    hyprlock
    ;;
  *);;
esac


#!/usr/bin/env bash

declare -A menu_list=(
  ["Cancel"]=""
  ["Lock Screen"]="~/.config/i3/i3lock.sh"
  ["Suspend"]="systemctl suspend"
  ["Reboot"]="systemctl reboot"
  ["Shutdown"]="systemctl poweroff"
  ["Logout"]="i3-msg exit"
)


function main() {
  local -r IFS=$'\n'
  [[ "${#}" -ne 0 ]] && eval "${menu_list[$1]}" || echo "${!menu_list[*]}"
}

main "${@}"

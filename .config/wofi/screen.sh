#!/usr/bin/env bash

positions=("up" "down" "left" "right" "ONLY")

options=""
for pos in "${positions[@]}"; do
  options+=$(printf "%s" "${output}" "auto-${pos}\n")
done
options+="mirror"

selected=$(echo -e -n "$options" | wofi -i --dmenu)

[ -z "$selected" ] && exit 0

TARGET_FILE="$HOME/.config/hypr/land/monitors.lua"

if [ "$selected" = "mirror" ]; then
  cat << EOF > "$TARGET_FILE"
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  mirror = "eDP-1",
  scale = 1,
})
EOF
  exit
fi

if [ "$selected" = "auto-ONLY" ]; then
  echo "only"
  cat << EOF > "$TARGET_FILE"
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1,
})
hl.monitor({
  output = "eDP-1",
  disabled = true,
})
EOF
else
  echo "not only but $selected"
  cat << EOF > "$TARGET_FILE"
hl.monitor({
  output = "",
  mode = "preferred",
  position = "$selected",
  scale = 1,
})
EOF
fi


#!/usr/bin/env bash

outputs=(
  "HDMI-1"
  "DP-1"
)
positions=("up" "down" "left" "right" "ONLY")

options=""
for output in "${outputs[@]}"; do
  for pos in "${positions[@]}"; do
    options+=$(printf "%6s -> %s" "${output}" "auto-${pos}\n")
  done
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


output=$(echo "$selected" | awk '{print $1}')
position=$(echo "$selected" | awk '{print $3}')


if [ "$position" = "auto-ONLY" ]; then
  echo "only"
  cat << EOF > "$TARGET_FILE"
hl.monitor({
  output = "$output",
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
  echo "not only but $position"
  cat << EOF > "$TARGET_FILE"
hl.monitor({
  output = "$output",
  mode = "preferred",
  position = "$position",
  scale = 1,
})
EOF
fi


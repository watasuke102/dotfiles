#!/usr/bin/sh

export GSK_RENDERER=cairo

CONFIG_DIR=$(dirname $0)

restart_ags() {
  while true; do
    hyprctl systeminfo 2>&1 > /dev/null && break
    sleep 0.5s
  done
  ags quit 2> /dev/null
  ags run --gtk 4 &
}
restart_ags

inotifywait --quiet --monitor --event create,modify,delete --recursive "${CONFIG_DIR}" \
  | while read DIR EVENT FILE; do
    echo "[debug] $EVENT: $DIR$FILE"
    ext=${FILE##*.}
    if [[ $ext == "ts" || $ext == "tsx" || $ext == "scss" ]]; then
      echo "Restarting..."
      restart_ags
    fi
  done

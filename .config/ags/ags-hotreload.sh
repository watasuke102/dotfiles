#!/usr/bin/sh

CONFIG_DIR=$(dirname $0)

restart_ags() {
  ags -q ; ags &
}
restart_ags

inotifywait --quiet --monitor --event create,modify,delete --recursive "${CONFIG_DIR}/src" \
  | while read DIR EVENT FILE; do
    echo "[debug] $EVENT: $DIR$FILE"
    if [[ ${FILE##*.} == "ts" ]]; then
      echo "Restarting..."
      restart_ags
    fi
  done

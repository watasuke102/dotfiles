#!/usr/bin/env bash

if [[ ! -d ~/.config/hypr/screen ]]; then
  exit 1
fi

conf_file=$(find ~/.config/hypr/screen -type f | wofi -i --dmenu)

if [[ $conf_file != "" ]]; then
  echo "source = $conf_file" > ~/.config/hypr/screen.conf
fi


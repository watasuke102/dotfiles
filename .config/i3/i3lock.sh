#!/usr/bin/env bash
# require i3lock-color

# keyhl = key highlight
# bshl  = backspace highlight
# font, inside, ring, text, general

LANG=C i3lock \
  --inside-color='#282c34bb' \
  --insidever-color='#282c34bb' \
  --insidewrong-color='#282c34bb' \
  \
  --ringver-color='#6eaafb' \
  --ringwrong-color='#eb6e67' \
  --ring-color='#95ee8f' \
  --line-color='#00000000' \
  --separator-color='#282c3411' \
  \
  --verif-color='#abb2bf' \
  --wrong-color='#abb2bf' \
  --modif-color='#abb2bf' \
  --time-color='#abb2bf' \
  --date-color='#abb2bf' \
  --keyhl-color='#282c3499' \
  --bshl-color='#eb6e67' \
  \
  --blur=8 --ignore-empty-password --indicator \
  --clock --time-str="%H:%M:%S" --date-str="%Y/%m/%d %a"


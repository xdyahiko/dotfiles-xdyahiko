#!/bin/sh
swayidle -w \
  timeout 1800 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on'

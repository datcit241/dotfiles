#!/bin/bash

while IFS='=' read -r key value; do
  # Skip empty lines or lines starting with #
  [[ -z "$key" || "$key" =~ ^# ]] && continue
  export "$key=$value"
done </tmp/environment_variables.txt

echo "$XDG_CURRENT_DESKTOP"
if [ "$XDG_CURRENT_DESKTOP" != "Hyprland" ]; then
  DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus qdbus6 org.freedesktop.ScreenSaver /ScreenSaver Lock
else
  hyprctl --instance 0 dispatch exec swaylock
fi

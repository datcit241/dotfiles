#!/bin/bash

# Concatenate all cron files and load them into the crontab
{
  echo "@reboot /usr/bin/bash /srv/shared/dotfiles/crons/load-crontabs.hyprland.sh"
  printf "\n"
  cat /srv/shared/dotfiles/crons/cron.user
  printf "\n"
  cat /srv/shared/dotfiles/crons/cron.hyprland
} | crontab -

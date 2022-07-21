#!/bin/bash

setxkbmap br
printf "Setting same layout for future sessions..."
sudo localectl set-x11-keymap br
printf "\nDone!\n"

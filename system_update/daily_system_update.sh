#!/bin/sh

TODAY=$(date +%Y%m%d%H%M%S)
LOGFILE=/tmp/$TODAY.txt

notify-send -t 3000 "Daily update" "Starting Void and flatpak update"

`touch $LOGFILE`

echo "### XBPS UPDATE ###" >> $LOGFILE
xbps-install -Suyv >> $LOGFILE

echo "### Restarting services ###" >> $LOGFILE
xcheckrestart >> $LOGFILE

echo "### FLATPAK UPDATE ###" >> $LOGFILE
flatpak update -yv >> $LOGFILE

notify-send -t 3000 "Daily update" "Void Linux and flatpak now, are up to date!"


#!/bin/bash

APP_NAME="Welcome script"
FILENAME=$(date +"%Y%m%d_%H%M%S_welcome.log")
FILE_PATH=/tmp/$FILENAME

GREETING="Bonjour"
HOUR=$(date +"%H")
if [ $HOUR -gt 11 -a $HOUR -lt 19 ]; then
    GREETING="Bon après-midi"
elif [ $HOUR -gt 18 -a $HOUR -le 23 ]; then
    GREETING="Bonne soirée"
fi

notify-send "$APP_NAME" "$GREETING, monsieur"

touch $FILE_PATH

echo "$APP_NAME" "Atualizando repositorios" >> $FILE_PATH
sudo apt-get update >> $FILE_PATH

echo "$APP_NAME" "Atualizando pacotes e removendo pacotes orfaos" >> $FILE_PATH
sudo apt-get -y  full-upgrade >> $FILE_PATH
sudo apt-get -y autoremove >> $FILE_PATH
sudo flatpack update -y >> $FILE_PATH

/usr/bin/subl $FILE_PATH

exit 0;

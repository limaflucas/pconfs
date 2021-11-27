#!/bin/bash

CURRENT_DIR=`pwd`

echo "Removing current files"
rm ~/.emacs

echo "Creating links for editors's folder"
ln -s $CURRENT_DIR/editors/emacs ~/.emacs

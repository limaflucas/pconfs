#!/bin/bash

CURRENT_DIR=`pwd`

echo "Preserving current configuraration files"
#EMACS
if [ -f $HOME/.emacs ]; then
    mv $HOME/.emacs $HOME/.emacs.bkp
fi

#BASH
if [ -f $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.bkp
fi

echo "Creating configuration links"
#EMACS
ln -fs $CURRENT_DIR/editors/emacs ~/.emacs

#BASH
ln -fs $CURRENT_DIR/bash/bashrc ~/.bashrc
source ~/.bashrc

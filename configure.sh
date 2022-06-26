#!/bin/bash

CURRENT_DIR=`pwd`

#EMACS
echo "<<<   Configuring EMACS files   >>>"
if [ -f $HOME/.emacs ]; then
    mv $HOME/.emacs $HOME/.emacs.bkp
fi
ln -fs $CURRENT_DIR/editors/emacs $HOME/.emacs

#BASH
echo "<<<   Configuring BASH files   >>>"
if [ -f $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.bkp
fi
ln -fs $CURRENT_DIR/bash/bashrc $HOME/.bashrc

#X
echo "<<<   Configuring X files   >>>"
if [ -f $HOME/.xinitrc ]; then
    mv $HOME/.xinitrc $HOME/.xinitrc.bkp
fi
ln -fs $CURRENT_DIR/X/xinitrc $HOME/.xinitrc

#PICOM
echo "<<<   Configuring PICOM files   >>>"
if [ -f $HOME/.config/picom/picom.conf ]; then
    mv $HOME/.config/picom/picom.conf $HOME/.config/picom/picom.conf.bpk
fi
ln -fs $CURRENT_DIR/picom/picom.conf $HOME/.config/picom/picom.conf

#XMOBAR
echo "<<<   Configuring XMOBAR files   >>>"
if [ -f $HOME/.xmobarrc ]; then
    mv $HOME/.xmobarrc $HOME/.xmobarrc.bkp
fi
ln -fs $CURRENT_DIR/xmobar/xmobarrc.hs $HOME/.xmobarrc

#XMONAD
echo "<<<   Configuring XMONAD files   >>>"
if [ -f $HOME/.xmonad/xmonad.hs ]; then
    mv $HOME/.xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs.bkp
fi
ln -fs $CURRENT_DIR/xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs
exec xmonad --recompile | xargs echo "!!!   xmonad recompile result    !!!\n"

echo "Don't forget to run source ~/.bashrc to update bash' configuration"
echo "Done for today! Bye ;)" 

#!/bin/bash

CURRENT_DIR=`pwd`

if [ ! -d $HOME/BKPs ]; then
    mkdir $HOME/BKPs
fi
BKPS_DIR=$HOME/BKPs

#EMACS
echo "<<<   Configuring EMACS files   >>>"
EMACS_HOME=$HOME/.emacs.d
if [ -f $HOME/.emacs ]; then
    mv $HOME/.emacs $BKPS_DIR/.emacs.bkp
    rm -r $HOME/.emacs
fi
if [ ! -d $EMACS_HOME ]; then
    mkdir $EMACS_HOME
fi
cp -r $CURRENT_DIR/emacs/* $EMACS_HOME/.

#BASH
echo "<<<   Configuring BASH files   >>>"
BASHRC=$HOME/.bashrc
if [ -f $BASHRC ]; then
    mv $BASHRC $BKPS_DIR/.bashrc.bkp
fi
cp $CURRENT_DIR/bash/bashrc $BASHRC

#X
echo "<<<   Configuring X files   >>>"
XINITRC=$HOME/.xinitrc
if [ -f $XINITRC ]; then
    mv $XINITRC $BKPS_DIR/.xinitrc.bkp
fi
cp $CURRENT_DIR/X/xinitrc $XINITRC

#GIT
echo "<<<   Configuring GIT files   >>>"
GITCONFIG=$HOME/.gitconfig
if [ -f $GITCONFIG ]; then
    mv $GITCONFIG $BKPS_DIR/.gitconfig.bkp
fi
cp $CURRENT_DIR/git/gitconfig $GITCONFIG

#PICOM
echo "<<<   Configuring PICOM files   >>>"
PICOM=$HOME/.config/picom/picom.conf
if [ -f $PICOM ]; then
    mv $PICOM $BKPS_DIR/picom.conf.bpk
else
    mkdir $HOME/.config/picom
fi    
cp $CURRENT_DIR/picom/picom.conf $PICOM

#XMOBAR
echo "<<<   Configuring XMOBAR files   >>>"
XMOBAR=$HOME/.xmobarrc
XMOBAR2=$HOME/.config/xmobar/xmobarrc
if [ -f  $XMOBAR ]; then
    mv $XMOBAR $BKPS_DIR/.xmobarrc.bkp
fi
if [ -f $XMOBAR2 ]; then
    mv $XMOBAR2 $BKPS_DIR/xmobarrc.bkp
else
    mkdir $HOME/.config/xmobar
fi
cp $CURRENT_DIR/xmobar/xmobarrc.hs $XMOBAR2
cp -r $CURRENT_DIR/xmobar/icons $HOME/.config/xmobar/.

#XMONAD
echo "<<<   Configuring XMONAD files   >>>"
XMONAD=$HOME/.config/xmonad/xmonad.hs
if [ -f $XMONAD ]; then
    mv $XMONAD $BKPS_DIR/xmonad.hs.bkp
else
    mkdir $HOME/.config/xmonad
fi
cp $CURRENT_DIR/xmonad/xmonad.hs $XMONAD
exec xmonad --recompile

echo "Don't forget to run source ~/.bashrc to update bash' configuration"
echo "Done for today! Bye ;)" 

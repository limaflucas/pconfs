#!/bin/bash


CURRENT_DIR=`pwd`
CONFIG_RUN=$1

configure_bkp_dir () {
    BKPS_DIR=$HOME/BKPs
    
    if [ ! -d $BKPS_DIR ]; then
        mkdir $BKPS_DIR
    fi
}

#EMACS
configure_emacs () {
    printf "<<<   Configuring EMACS files   >>>\n"
    EMACS_HOME=$HOME/.emacs.d
    
    if [ -f $HOME/.emacs ]; then
        mv $HOME/.emacs $BKPS_DIR/.emacs.bkp
        cp -r $HOME/.emacs.d/ $BKPS_DIR/.
        rm -r $HOME/.emacs
    fi
    if [ ! -d $EMACS_HOME ]; then
        mkdir $EMACS_HOME
    fi
    cp -r $CURRENT_DIR/emacs/* $EMACS_HOME/.
}

#BASH
configure_bash () {
    printf "<<<   Configuring BASH files   >>>\n"
    BASHRC=$HOME/.bashrc

    if [ -f $BASHRC ]; then
        mv $BASHRC $BKPS_DIR/.bashrc.bkp
    fi
    cp $CURRENT_DIR/bash/bashrc $BASHRC
}

#X
configure_x () {
    printf "<<<   Configuring X files   >>>\n"
    XINITRC=$HOME/.xinitrc
 
    if [ -f $XINITRC ]; then
        mv $XINITRC $BKPS_DIR/.xinitrc.bkp
    fi
    cp $CURRENT_DIR/X/xinitrc $XINITRC
}

#GIT
configure_git () {
    printf "<<<   Configuring GIT files   >>>\n"
    GITCONFIG=$HOME/.gitconfig
    
    if [ -f $GITCONFIG ]; then
        mv $GITCONFIG $BKPS_DIR/.gitconfig.bkp
    fi
    cp $CURRENT_DIR/git/gitconfig $GITCONFIG
}

#PICOM
configure_picom () {
    printf "<<<   Configuring PICOM files   >>>\n"
    PICOM=$HOME/.config/picom/picom.conf
    
    if [ -f $PICOM ]; then
        mv $PICOM $BKPS_DIR/picom.conf.bpk
    else
        mkdir $HOME/.config/picom
    fi    
    cp $CURRENT_DIR/picom/picom.conf $PICOM
}

#XMOBAR
configure_xmobar () {
    printf "<<<   Configuring XMOBAR files   >>>\n"
    XMOBAR=$HOME/.xmobarrc
    XDG_XMOBAR=$HOME/.config/xmobar
    
    if [ -f  $XMOBAR ]; then
        mv $XMOBAR $BKPS_DIR/.xmobarrc.bkp
    fi
    if [ -f $XDG_XMOBAR/xmobarrc ]; then
        mv $XDG_XMOBAR/xmobarrc $BKPS_DIR/xmobarrc.bkp
    else
        mkdir $HOME/.config/xmobar
    fi
    cp $CURRENT_DIR/xmobar/xmobarrc.hs $XDG_XMOBAR/xmobarrc
    cp -r $CURRENT_DIR/xmobar/icons $HOME/.config/xmobar/.
}

#XMONAD
configure_xmonad () {
    printf "<<<   Configuring XMONAD files   >>>\n"
    XMONAD=$HOME/.config/xmonad/xmonad.hs

    if [ -f $XMONAD ]; then
        mv $XMONAD $BKPS_DIR/xmonad.hs.bkp
    else
        mkdir $HOME/.config/xmonad
    fi
    cp $CURRENT_DIR/xmonad/xmonad.hs $XMONAD
    exec xmonad --recompile
}

#QTILE
configure_qtile () {
    printf "<<<   Configuring QTile files   >>>\n"
    QTILE=$HOME/.config/qtile

    if [ -f $QTILE ]; then
        mv $QTILE $BKPS_DIR/.
    else
        mkdir $QTILE
    fi
    cp $CURRENT_DIR/qtile/config.py $QTILE/.
    printf "<<<   Compiling QTile configuration   >>>\n"
    echo `python3 -m py_compile $QTILE/config.py`
    printf "<<<   QTile Configuration Completed   >>>\n"
}

if [ ! $CONFIG_RUN ]; then
    printf "Which configuration would you like to update? "
    read CONFIG
else
    CONFIG=$CONFIG_RUN
fi

configure_bkp_dir

case $CONFIG in
    emacs | EMACS)
        configure_emacs ;;
    bash | BASH)
        configure_bash ;;
    x | X)
        configure_x ;;
    git | GIT)
        configure_git ;;
    picom | PICOM)
        configure_picom ;;
    xmobar | XMOBAR)
        configure_xmobar ;;
    xmonad | XMONAD)
        configure_xmonad ;;
    qtile | QTILE)
        configure_qtile ;;
    all | ALL)
        configure_emacs
        configure_bash 
        configure_x
        configure_git
        configure_picom
        configure_xmobar
        configure_xmonad
        configure_qtile
        ;;
    *)
        printf "Unknown configuration!\n" ;;
esac

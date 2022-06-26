#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# xmonad auto startup
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

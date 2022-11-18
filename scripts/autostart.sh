#!/bin/bash

xrdb -merge ~/.config/bspwm/xresources/xresources

xsetroot -cursor_name left_ptr

alias rofi='rofi -config=~/.config/bspwm/rofi/config.rasi -show drun'
alias ranger='ranger --confdir=~/.config/bspwm/ranger'

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx


picom --config ~/.config/bspwm/picom/picom.conf &

arr=("copyq" "fcitx" "xdman" "picom"\
	"~/.config/bspwm/bin/bspbar"\
	"~/.config/bspwm/bin/bsphotkey"\
	"~/.config/bspwm/bin/bspnotifier"\
	"~/.config/bspwm/bin/bspwallpaper"\
	"~/.config/bspwm/bin/bspautolight"\
)

for value in ${arr[@]}
do
    isExist=`ps -ef | grep "$value" | grep -v grep | wc -l`
    if [ $isExist == 0 ]
    then
        exec "$value" &
    fi
done

xmodmap ~/.config/bspwm/xmodmap/xmodmap

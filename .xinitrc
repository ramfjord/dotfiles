#!/bin/sh

setxkbmap -option caps:escape
feh --bg-scale ~/.config/i3/cheatsheet.png
sxhkd &

# autostart apps
# dex -a

exec i3

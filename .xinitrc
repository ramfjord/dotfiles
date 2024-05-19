export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS
pulseaudio --start
setxkbmap -option caps:swapescape
exec awesome

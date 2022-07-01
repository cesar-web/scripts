#!bin/sh

program="$(ls /usr/bin/ | fzf --layout=reverse --info=inline --border --margin=1 --padding=1)"
setsid -f $program

#!/bin/dash

cd
directory=$(fd -E .cache -E .vim -E .local -H --type d | cut -c 3- | fzf --layout=reverse --info=inline --border --margin=1 --padding=1)

if [ "$directory" != '' ]; then
    cd "$directory"
    pwd
    ls -la --color=always --group-directories-first
    zsh
fi

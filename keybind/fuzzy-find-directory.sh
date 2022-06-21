#!bin/sh

# Go to home directory and search for directories
cd
directory="$(fd -E .cache -E .vim -E .local -E go -H --type d | cut -c 3- | fzf --layout=reverse --info=inline --border --margin=1 --padding=1)"

# Dont open anything if the user quit
if [ "$directory" != '' ]; then
    cd "$directory"
    pwd
    ls -la --color=always --group-directories-first
    zsh
fi


#!bin/sh

# Go to home directory and search for directories
cd
directory="$(find * ~/.bin -type d | amenu)"

# Dont open anything if the user quit
if [ "$directory" != '' ]; then
    cd $directory
    pwd
    echo " "
    ls -la --color=always --group-directories-first
    zsh
fi


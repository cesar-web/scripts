#!/bin/bash

trap "rm output" INT TERM

files=$(ls | grep ".cpp$")
amount=$(echo $files | wc -l)

if [ $amount -ne 1 ]; then
    files=$(echo $files | fzf --layout=reverse --info=inline --border --margin=1 --padding=1)
fi

g++ $files -o output
./output
rm output

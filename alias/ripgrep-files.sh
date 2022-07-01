#!/bin/sh

RG_PREFIX="rg --files-with-matches"
file="$(FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
    fzf --sort --preview="[[ ! -z {} ]] && rg --pretty --context 5 {q} {}"\
    --layout=reverse --info=inline --border --margin=1 --padding=1 \
    --phony -q "$1" \
    --bind "change:reload:$RG_PREFIX {q}" \
    --preview-window="bottom,80%:wrap")"

if [ "$file" != '' ]; then
nvim "$file"
fi

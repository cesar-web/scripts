#!bin/sh

# Go to home directory and search for files
cd
file="$(fd -E .cache -E .vim -E .local -E go -H --type f | cut -c 3- | fzf --layout=reverse --info=inline --border --margin=1 --padding=1)"

# Get file extension
extension=$(echo ${file} | awk -F . '{print $NF}')
extension=$(echo ${extension} | awk '{print tolower($0)}')

# Get file directory and cd into it
# This is so coc can work correctly
absolutedir=$(echo $file | sed 's%/[^/]*$%/%')
cd "$absolutedir"

# Strip filename and replace spaces with '\ '
file=$(echo $file | sed "s/.*\///")
file=$(echo $file | sed 's! !\\ !g')

# Dont open anything if the user quit
if [ "$file" != '' ]; then
    case $extension in
        mp3 ) devour mpv "$file" ;;
        wav ) devour mpv "$file" ;;
        wma ) devour mpv "$file" ;;
        flac) devour mpv "$file" ;;

        mp4 ) devour mpv "$file" ;;
        mov ) devour mpv "$file" ;;
        wmv ) devour mpv "$file" ;;
        mkv ) devour mpv "$file" ;;

        jpg ) devour sxiv "$file" ;;
        jpeg) devour sxiv "$file" ;;
        png ) devour sxiv "$file" ;;
        webp) devour sxiv "$file" ;;
        gif ) devour sxiv -a "$file" ;;

        pdf ) devour zathura "$file" ;;
        epub) devour zathura "$file" ;;

        *) nvim "$file"
    esac
fi

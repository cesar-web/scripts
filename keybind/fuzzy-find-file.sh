#!bin/sh

# Go to home directory and search for files
cd
file="$(find * ~/.config/ ~/.bin ~/.zshrc ~/.xinitrc -type f | amenu)"

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
        mp3 ) mpv $file ;;
        wav ) mpv $file ;;
        wma ) mpv $file ;;
        flac) mpv $file ;;

        mp4 ) mpv $file ;;
        mov ) mpv $file ;;
        wmv ) mpv $file ;;

        jpg ) feh --scale-down --auto-zoom $file ;;
        jpeg) feh --scale-down --auto-zoom $file ;;
        png ) feh --scale-down --auto-zoom $file ;;
        gif ) feh --scale-down --auto-zoom $file ;;
        webp) feh --scale-down --auto-zoom $file ;;

        pdf ) zathura $file ;;
        epub) zathura $file ;;

        *) nvim $file
    esac
fi

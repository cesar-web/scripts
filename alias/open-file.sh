#!/bin/sh

if [ "$1" != '' ]; then

    # Get file extension
    extension=$(echo ${1} | awk -F . '{print $NF}')
    extension=$(echo ${extension} | awk '{print tolower($0)}')

    case $extension in
        mp3 ) devour mpv "$1" ;;
        wav ) devour mpv "$1" ;;
        wma ) devour mpv "$1" ;;
        flac) devour mpv "$1" ;;

        mp4 ) devour mpv "$1" ;;
        mov ) devour mpv "$1" ;;
        wmv ) devour mpv "$1" ;;
        mkv ) devour mpv "$1" ;;

        jpg ) devour sxiv "$1" ;;
        jpeg) devour sxiv "$1" ;;
        png ) devour sxiv "$1" ;;
        webp) devour sxiv "$1" ;;
        gif ) devour sxiv -a "$1" ;;

        pdf ) devour zathura "$1" ;;
        epub) devour zathura "$1" ;;

        *) nvim "$1"
    esac
fi


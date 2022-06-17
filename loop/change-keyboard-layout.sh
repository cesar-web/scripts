#!/bin/sh

while true; do
    setxkbmap -option caps:swapescape
    setxkbmap -variant altgr-intl
    sleep 1s
done

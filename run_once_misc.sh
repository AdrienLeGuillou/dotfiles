#!/bin/sh

xdg-user-dirs-update

if [ ! -f "Pictures/wallpaper" ]
then
    touch Pictures/wallpaper
fi

#!/bin/sh

if [ ! -f "Pictures/wallpaper" ]
then
    touch Pictures/wallpaper
fi

xdg-user-dirs-update

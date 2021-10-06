#!/bin/sh

cp base.xml /usr/share/X11/xkb/rules
cp evdev.xml /usr/share/X11/xkb/rules
cp base.lst /usr/share/X11/xkb/rules
cp evdev.lst /usr/share/X11/xkb/rules
cp enfr /usr/share/X11/xkb/symbols

rm base.xml
rm evdev.xml
rm base.lst
rm evdev.lst

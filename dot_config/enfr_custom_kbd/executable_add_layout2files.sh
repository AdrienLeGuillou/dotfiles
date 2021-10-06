#!/bin/sh

# Copy the files from /usr/share
cp /usr/share/X11/xkb/rules/base.lst ./
cp /usr/share/X11/xkb/rules/base.xml ./

# make copies for security
cp base.lst base.lst_save
cp base.xml base.xml_save

# Add the snips where thes belong
line=$(grep -n '! layout' base.lst | cut -d ":" -f 1)
{ head -n $line base.lst; cat lst_snip; tail -n +$(($line+1)) base.lst; } > base.lst_new

line=$(grep -n '<layoutList>' base.xml | cut -d ":" -f 1)
{ head -n $line base.xml; cat xml_snip; tail -n +$(($line+1)) base.xml; } > base.xml_new

cp base.lst_new base.lst
cp base.lst_new evdev.lst
cp base.xml_new base.xml
cp base.xml_new evdev.xml

rm base.lst_new base.xml_new

#!/bin/sh

sudo pacman -S --needed base-devel

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ..
rm -rf paru-bin

paru -S archlinux-keyring
paru
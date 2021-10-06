#!/bin/sh

paru

paru -S --needed \
    man-db \
    man-pages \
    ttf-hack \
    ttf-unifont \
    otf-font-awesome \
    noto-fonts \
    sway \
    alacritty \
    foot \
    mako \
    slurp \
    grim \
    swayidle \
    swaylock \
    waybar \
    xorg-xwayland \
    xdg-user-dirs \
    xdg-desktop-portal-wlr \
    htop \
    rofi-lbonn-wayland-git \
    wl-clipboard \
    oh-my-zsh-git \
    ranger \
    bat \
    fd \
    ripgrep \
    fzf \
    tmux \
    openssh \
    autojump \
    light \
    kanshi \
    wdisplays \
    swayr \
    qt5-wayland \
    pcmanfm-qt \
    qutebrowser \
    featherpad \
    firefox \
    gvfs-mtp \
    adwaita-icon-theme \
    pulseaudio \
    pavucontrol \
    playerctl-git \
    r \
    openblas

sudo systemctl enable reflector.service

#!/bin/sh

paru

paru -S --needed \
    reflector \
    man-db \
    man-pages \
    ttf-hack \
    ttf-unifont \
    otf-font-awesome \
    noto-fonts \
    sway \
    alacritty \
    foot \
    zsh-completions \
    hunspell-en_us \
    hunspell-fr \
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
    zathura-pdf-mupdf \
    vlc \
    megasync-bin \
    pamixer \ 
    feh \
    gvfs-mtp \
    adwaita-icon-theme \
    pulseaudio \
    pavucontrol \
    playerctl-git \
    r \
    openblas \
    gcc-fortran \
    tk

sudo systemctl enable reflector.service

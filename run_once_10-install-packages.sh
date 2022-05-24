#!/bin/sh

paru

paru -S --needed \
    reflector \
    auto-cpufreq \
    man-db \
    man-pages \
    ttf-hack \
    nerd-fonts-hack \
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
    libnotify \
    slurp \
    grim \
    swayidle \
    swaylock \
    waybar \
    xorg-xwayland \
    xdg-user-dirs \
    xdg-desktop-portal-wlr \
    lxqt-policykit \
    xorg-xhost \
    htop \
    rofi-lbonn-wayland-git \
    wl-clipboard \
    oh-my-zsh-git \
    ranger \
    atool \
    trash-cli \
    p7zip \
    unrar \
    file-roller \
    bat \
    fd \
    ripgrep \
    fzf \
    tmux \
    tmuxp \
    openssh \
    autojump \
    light \
    kanshi \
    wdisplays \
    qt5-wayland \
    thunar \
    pam_mount \
    qutebrowser \
    python-adblock \
    featherpad \
    firefox \
    zathura-pdf-mupdf \
    vlc \
    megasync-bin \
    pamixer \
    lximage-qt \
    darktable \
    intel-compute-runtime \
    clinfo \
    gvfs-mtp \
    adwaita-icon-theme \
    pipewire-pulse \
    pavucontrol \
    playerctl-git \
    pacman-contrib \
    transmission-cli \
    transmission-qt \
    ccls \
    r \
    openblas \
    gcc-fortran \
    libgit2 \
    tk

sudo systemctl enable auto-cpufreq.service
sudo systemctl enable fstrim.timer
sudo systemctl enable ufw.service
sudo ufw enable
sudo ufw allow Transmission
lensfun-update-data

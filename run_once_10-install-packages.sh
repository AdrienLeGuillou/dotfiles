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
    foot-terminfo \
    zsh-completions \
    hunspell-en_us \
    hunspell-fr \
    mako \
    libnotify \
    grim \
    flameshot \
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
    vlc \
    megasync-bin \
    lximage-qt \
    darktable \
    intel-compute-runtime \
    opencl-amd \
    clinfo \
    gvfs-mtp \
    adwaita-icon-theme \
    pipewire-pulse \
    pamixer \
    pavucontrol \
    pacman-contrib \
    transmission-cli \
    transmission-qt \
    ccls \
    r \
    openblas \
    gcc-fortran \
    libgit2 \
    ufw \
    tk

sudo systemctl enable auto-cpufreq.service
sudo systemctl enable fstrim.timer
sudo systemctl enable ufw.service
sudo ufw enable
sudo ufw allow Transmission
lensfun-update-data

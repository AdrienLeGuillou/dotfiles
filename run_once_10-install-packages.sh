#!/bin/sh

paru

paru -S --needed \
    neovim \
    reflector \
    man-db \
    man-pages \
    ttf-hack-nerd \
    ttf-unifont \
    ttf-caladea \
    ttf-carlito \
    noto-fonts \
    otf-font-awesome \
    alacritty \
    xclip \
    obsidian \
    zsh \
    zsh-completions \
    rsync \
    hunspell-en_us \
    hunspell-fr \
    fscrypt \
    pacman-cleanup-hook \
    fwupd \
    htop \
    cpupower \
    oh-my-zsh-git \
    p7zip \
    libreoffice-fresh \
    bat \
    fd \
    ripgrep \
    fzf \
    dust \
    exa \
    bat \
    gitui \
    tmux \
    tmuxp \
    openssh \
    autojump \
    spotifyd \
    openssl-1.1 \
    megasync-bin \
    pam_mount \
    firefox \
    chromium \
    vlc \
    zotero-bin \
    darktable \
    displaycal \
    clinfo \
    sof-firmware \
    alsa-firmware \
    alsa-utils \
    alsa-tools \
    pavucontrol \
    dkms \
    pacman-contrib \
    transmission-gtk \
    vulkan-tools \
    intel-media-driver \
    intel-compute-runtime\
    r \
    radian \
    glpk \
    imagemagick \
    openblas \
    gcc-fortran \
    libgit2 \
    ufw \
    rustup \
    rust-analyzer \
    bash-language-server \
    tk

sudo systemctl enable fstrim.timer

sudo systemctl enable bluetooth.service
sudo systemctl enable ufw.service
sudo systemctl start ufw.service
sudo ufw enable
sudo ufw allow 1714:1764/udp #kde connect
sudo ufw allow 1714:1764/tcp #kde connect
sudo ufw allow Transmission

lensfun-update-data

rustup default stable
rustup component add rust-src

## # install f5 vpn. Usually checks don't work
## paru -S arch4edu-keyring
## paru
## paru -S --mflags "--skipchecksums --skippgpcheck" f5epi f5vpn f5fpc

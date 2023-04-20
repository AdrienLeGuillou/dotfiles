#!/bin/sh

paru

paru -S --needed \
    neovim \
    lazygit \
    reflector \
    borg \
    man-db \
    man-pages \
    ttf-hack \
    nerd-fonts-hack \
    ttf-unifont \
    ttf-caladea \
    ttf-carlito \
    noto-fonts \
    otf-font-awesome \
    noto-fonts \
    autologin \
    sway \
    wev \
    alacritty \
    foot \
    foot-terminfo \
    zsh \
    zsh-completions \
    rsync \
    hunspell-en_us \
    hunspell-fr \
    mako \
    libnotify \
    grim \
    flameshot \
    swaybg \
    swayidle \
    swaylock \
    waybar \
    fscrypt \
    xorg-xwayland \
    xdg-user-dirs \
    xdg-desktop-portal-wlr \
    lxqt-policykit \
    xorg-xhost \
    pacman-cleanup-hook \
    qdirstat \
    fwupd \
    htop \
    cpupower \
    rofi-lbonn-wayland-git \
    wl-clipboard \
    oh-my-zsh-git \
    atool \
    trash-cli \
    p7zip \
    evince \
    libreoffice-fresh \
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
    spotifyd \
    openssl-1.1 \
    spotify-tui-bin \
    kanshi \
    wdisplays \
    qt5-wayland \
    thunar \
    megasync-bin \
    pam_mount \
    qutebrowser \
    python-adblock \
    featherpad \
    firefox \
    vlc \
    megasync-bin \
    zotero-bin \
    lximage-qt \
    oxygen-icons \
    darktable \
    displaycal \
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

sudo systemctl enable ufw.service
sudo systemctl start ufw.service
sudo ufw enable
sudo ufw allow Transmission

lensfun-update-data

rustup default stable
rustup component add rust-src

## # install f5 vpn. Usually checks don't work
## paru -S arch4edu-keyring
## paru
## paru -S --mflags "--skipchecksums --skippgpcheck" f5epi f5vpn f5fpc

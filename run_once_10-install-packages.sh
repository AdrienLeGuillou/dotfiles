#!/bin/sh

paru

paru -S --needed \
    neovim \
    lazygit \
    reflector \
    borg \
    auto-cpufreq \
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
    pacman-cleanup-hook \
    qdirstat \
    fwupd \
    htop \
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
    zotero-bin \
    lximage-qt \
    darktable \
    displaycal \
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
    radian \
    openblas \
    gcc-fortran \
    libgit2 \
    ufw \
    rustup \
    rust-analyzer \
    bash-language-server \
    tk

sudo systemctl enable auto-cpufreq.service
sudo systemctl enable fstrim.timer
sudo systemctl enable ufw.service
sudo ufw enable
sudo ufw allow Transmission
sudo chsh -s /bin/zsh adrien
lensfun-update-data

rustup default stable
rustup component add rust-src

# setup autologin - DO ONLY IF ENCRYPTED DRIVE
# sudo sed -i "s|ExecStart=autologin.*|ExecStart=autologin adrien zsh --login -c ~/.local/bin/sway|" /usr/lib/systemd/system/autologin.service
# sudo systemctl enable autologin.service

# install f5 vpn. Usually checks don't work
paru -S --mflags "--skipchecksums --skippgpcheck" f5epi f5vpn f5fpc

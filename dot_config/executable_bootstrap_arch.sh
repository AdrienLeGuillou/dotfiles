#!/bin/sh

# Use paru-bin
sudo pacman -S --needed --noconfirm base-devel git

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ..
rm -rf paru-bin

paru -S --noconfirm  archlinux-keyring
paru

read -p "Press Enter to continue" </dev/tty

# install packages
paru -S --needed --noconfirm  \
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
    foot \
    foot-terminfo \
    wl-clipboard \
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
    openssh \
    autojump \
    spotifyd \
    megasync-bin \
    pam_mount \
    firefox \
    chromium \
    vlc \
    zotero-bin \
    darktable \
    krita \
    displaycal \
    clinfo \
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
    openblas64 \
    gcc-fortran \
    libgit2 \
    rustup \
    rust-analyzer \
    bash-language-server \
    ufw \
    tk \
    fprintd


read -p "Press Enter to continue" </dev/tty

# enable
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

read -p "Press Enter to continue" </dev/tty

# # install f5 vpn. Usually checks don't work
# paru -S --noconfirm  arch4edu-keyring
# paru
# paru -S --mflags "--skipchecksums --skippgpcheck" f5epi f5vpn f5fpc

# change shell to ZSH
sudo chsh -s /bin/zsh adrien

# chezmoi -> use ssh
chezmoi git remote set-url origin git@github.com:AdrienLeGuillou/dotfiles.git

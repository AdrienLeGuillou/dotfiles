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
    gnome-browser-connector \
    neovim \
    reflector \
    man-db \
    man-pages \
    ttf-caladea \
    ttf-carlito \
    noto-fonts \
    otf-font-awesome \
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


read -p "Fonts - Press Enter to continue" </dev/tty

mkdir -p ~/.local/share/fonts
curl -fLO https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf
mv HackNerdFont-Regular.ttf ~/.local/share/fonts/

read -p "Oh My Zsh - Press Enter to continue" </dev/tty
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

read -p "F5 - Press Enter to continue" </dev/tty

# # install f5 vpn. Usually checks don't work
# paru -S --noconfirm  arch4edu-keyring
# paru
# paru -S --mflags "--skipchecksums --skippgpcheck" f5epi f5vpn f5fpc

# chezmoi -> use ssh
chezmoi git remote set-url origin git@github.com:AdrienLeGuillou/dotfiles.git

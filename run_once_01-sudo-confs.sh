#!/bin/sh

sudo chsh -s /bin/zsh adrien
sudo usermod -a -G input,video,audio,storage,disk,kvm adrien

sudo mkdir -p /etc/systemd/logind.conf.d/
echo 'HandlePowerKey=ignore' | sudo tee /etc/systemd/logind.conf.d/40-powerbutton.conf

echo '[zram0]
zram-fraction = 0.5' | sudo tee /etc/systemd/zram-generator.conf

sudo mkdir -p /etc/NetworkManager/dispatcher.d

echo '#!/bin/sh
case "$2" in
    up)
        timedatectl set-timezone "$(curl --fail https://ipapi.co/timezone)"
    ;;
esac' | sudo tee /etc/NetworkManager/dispatcher.d/09-timezone
sudo timedatectl set-ntp true

# # needs arch4edu to get bin for qt5-webkit (otherwise 2h compile)
# sudo sh -c "echo '
# [arch4edu]
# Server = https://at.arch4edu.mirror.kescher.at/$arch
# Server = https://mirror.lesviallon.fr/arch4edu/$arch
# Server = https://pkg.fef.moe/arch4edu/$arch
# Server = https://de.arch4edu.mirror.kescher.at/$arch
# Server = https://arch4edu.keybase.pub/$arch
# Server = https://mirrors.tuna.tsinghua.edu.cn/arch4edu/$arch
# Server = https://mirrors.aliyun.com/arch4edu/$arch
# Server = https://mirrors.bfsu.edu.cn/arch4edu/$arch
# Server = https://mirror.iscas.ac.cn/arch4edu/$arch
# Server = https://mirrors.nju.edu.cn/arch4edu/$arch
# Server = https://mirrors.pinganyun.com/arch4edu/$arch
# Server = https://mirrors.sau.edu.cn/arch4edu/$arch
# Server = https://mirrors.tencent.com/arch4edu/$arch
# Server = https://mirrors.ynu.edu.cn/arch4edu/$arch
# ' >> /etc/pacman.conf"

#!/bin/sh

sudo mkdir -p /etc/systemd/logind.conf.d/
sudo echo 'HandlePowerKey=ignore' > /etc/systemd/logind.conf.d/40-powerbutton.conf

sudo echo '[zram0]
zram-fraction = 0.5' > /etc/systemd/zram-generator.conf


sudo mkdir -p /etc/NetworkManager/dispatcher.d
sudo echo '#!/bin/sh
case "$2" in 
    up)
        timedatectl set-timezone "$(curl --fail https://ipapi.co/timezone)"
    ;;
esac' > /etc/NetworkManager/dispatcher.d/09-timezone

sudo timedatectl set-ntp true

sudo systemctl enable reflector

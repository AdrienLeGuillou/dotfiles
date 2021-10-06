#!/bin/sh

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

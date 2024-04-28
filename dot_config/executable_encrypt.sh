#!/bin/bash

if [[ -e "$1" ]]
then
    echo "Encrypted folder will be created on $1, continue?"
    read
else
    echo "Partition does not exist, stop"
    exit 1
fi

sudo sed -i '/^auth *include *system-auth/a auth optional pam_fscrypt.so' /etc/pam.d/system-login
sudo sed -i '/^session *include *system-auth/i session [success=1 default=ignore] pam_succeed_if.so service = systemd-user quiet\nsession optional pam_fscrypt.so' /etc/pam.d/system-login
sudo sed -i '$ a password    optional    pam_fscrypt.so' /etc/pam.d/passwd

sudo tune2fs -O encrypt "$1"
#sudo fscrypt setup /home # yes to non root user
sudo fscrypt setup # yes to non root user
mkdir ~/Documents/Data
fscrypt encrypt ~/Documents/Data

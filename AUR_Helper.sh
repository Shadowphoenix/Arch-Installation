#!/bin/bash
#execute as user, makepkg as root causes hickups every now and then

set -x #echo on

cd /tmp
sudo git clone https://aur.archlinux.org/yay-git.git

sudo chown -R neko ./yay-git #own to user for full access (modify user)

cd ./yay-git

makepkg -si

#Installing Pamac - select yes for cleanup so all build-deps get erased once done

sudo yay -Syu
yay -Syu pamac-aur

exit0

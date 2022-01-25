#!/bin/bash
#execute script as a user, makepkg and yay executed as root cause hickups
#Using YetAnotherYogurt/yay as CLI-AUR-Helper to install Pamac

set -x #echo on

#installing yay
cd /tmp
sudo git clone https://aur.archlinux.org/yay-git.git 
sudo chown -R neko ./yay-git #Own Buildirectory to user for full access (modify user as needed)
cd ./yay-git
makepkg -si #Building Yay

yay --builddir /mnt/install/yay
#installing pamac
yay -Syu pamac-all #Installing Pamac + Dependencies

yay -Syu davinci-resolve isw optimus-manager-git optimus-manager-qt-git ytmdesktop-bin betterdiscord-installer-bin bottles-git dxvk-bin lib32-libdxvk libdxvk

systemctl enable optimus-manager

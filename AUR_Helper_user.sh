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
yay -Syu pamac-aur #Installing Pamac + Dependencies

#execute script as a user, makepkg executed as root causes hickups
#Using YetAnotherYogurt/yay as CLI-AUR-Helper to install Pamac

#!/bin/bash

set -x #echo on

cd /tmp

sudo git clone https://aur.archlinux.org/yay-git.git 

sudo chown -R neko ./yay-git #Own Buildirectory to user for full access (modify user as needed)

cd ./yay-git

makepkg -si #Building Yay

sudo yay -Syu pamac-aur #Installing Pamac + Dependencies

exit0

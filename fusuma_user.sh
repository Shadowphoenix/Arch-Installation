#!/bin/bash

set -x #echo on

#adding rubygems to $PATH
echo 'export PATH="$PATH:/home/neko/.local/share/gem/ruby/3.0.0/bin"' >> ~/.bashrc

#prerequisites
sudo gpasswd -a $USER input
newgrp input

#installing necessities
sudo pacman -Syu libinput ruby xdotool

#installing fusuma + plugins
gem install fusuma
gem install fusuma-plugin-sendkey
gem install fusuma-plugin-wmctrl
gem install fusuma-plugin-keypress
gem install fusuma-plugin-tap
gem install fusuma-plugin-appmatcher

exit 0

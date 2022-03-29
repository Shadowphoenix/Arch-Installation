#!/bin/bash

set -x #echo on
#installing necessities
sudo pacman -Syu --needed --noconfirm libinput ruby xdotool libevdev wmctrl

#installing fusuma + plugins
sudo gem install fusuma
sudo gem install fusuma-plugin-sendkey
sudo gem install fusuma-plugin-wmctrl
sudo gem install fusuma-plugin-keypress
sudo gem install fusuma-plugin-tap
sudo gem install fusuma-plugin-appmatcher

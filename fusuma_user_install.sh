#!/bin/bash

set -x #echo on
#installing necessities
sudo pacman -Syu libinput ruby xdotool

#installing fusuma + plugins
gem install fusuma
gem install fusuma-plugin-sendkey
gem install fusuma-plugin-wmctrl
gem install fusuma-plugin-keypress
gem install fusuma-plugin-tap
gem install fusuma-plugin-appmatcher

#!/bin/bash

set -x #echo on

#adding rubygems to $PATH
sudo gpasswd -a $USER input
echo 'export PATH="$PATH:~/.local/share/gem/ruby/3.0.0/bin"' >> ~/.bashrc
newgrp input

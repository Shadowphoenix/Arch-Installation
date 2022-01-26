#!/bin/bash

set -x #echo on

#adding rubygems to $PATH
echo 'export PATH="$PATH:/home/neko/.local/share/gem/ruby/3.0.0/bin"' >> ~/.bashrc
echo 'export PATH="$PATH:/root/.local/share/gem/ruby/3.0.0/bin"' >> ~/.bashrc

#prerequisites
sudo gpasswd -a $USER input
newgrp input

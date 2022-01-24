#!/bin/bash

set -x #echo on

chsh -s /bin/fish

sudo echo 'neofetch | lolcat' >> /etc/fish/config.fish

exit0

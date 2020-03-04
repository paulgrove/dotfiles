#!/bin/bash

set -e

cargo install leftwm

PATH_TO_LEFTWM=$(find $HOME/.cargo -name leftwm.desktop)
sudo cp $PATH_TO_LEFTWM /usr/share/xsessions/

# for the default theme
sudo apt install -y lemonbar compton feh suckless-tools

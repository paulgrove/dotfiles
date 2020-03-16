#!/bin/bash

cd $HOME/.dotfiles/tmux
sh autogen.sh
./configure
make
sudo make install

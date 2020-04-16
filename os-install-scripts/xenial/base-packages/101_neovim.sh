#!/bin/bash

sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
python3 -m pip install --user --upgrade pynvim
python2 -m pip install --user --upgrade pynvim

python3 -m pip install --user --upgrade cryptography
python2 -m pip install --user --upgrade cryptography

sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

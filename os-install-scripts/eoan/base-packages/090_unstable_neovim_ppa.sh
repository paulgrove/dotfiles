#!/bin/bash

set -e

sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable

#!/bin/bash

set -e

sudo mkdir -p /usr/local/share/ca-certificates/os-install-certs
sudo cp $HOME/.dotfiles/certs/*.crt /usr/local/share/ca-certificates/os-install-certs
sudo update-ca-certificates

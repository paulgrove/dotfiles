#!/bin/bash

set -e

sudo mkdir -p /usr/local/share/ca-certificates/os-install-certs
sudo cp $HOME/.dot-files/certs/*.crt /usr/local/share/ca-certificates/os-install-certs
sudo update-ca-certificates

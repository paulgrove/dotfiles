#!/bin/bash

set -e

sudo apt-get update -y
# Useful apps:
sudo apt-get install -y kitty chromium filezilla gimp google-chrome-stable
# VPN packages used at work:
sudo apt-get install -y openconnect network-manager-openconnect network-manager-openconnect-gnome

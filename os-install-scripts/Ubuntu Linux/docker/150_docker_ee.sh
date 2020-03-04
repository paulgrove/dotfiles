#!/bin/bash

set -e

# remove old docker
sudo apt-get -y remove docker docker-engine docker.io containerd runc || true

sudo apt-get update -y

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER

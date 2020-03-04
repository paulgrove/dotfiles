#!/bin/bash

set -e

#sudo apt-get install -y libnss3-tools
#
#if ! -d $HOME/.pki/nssdb; then
#	mkdir -p $HOME/.pki/nssdb;
#	certutil -N -d sql:$HOME/.pki/nssdb;
#fi
#
#find $HOME/.dot-files/certs -type f -exec sudo certutil -d sql:.pki/nssdb -A -t "CT,c,c" -n {} -i {} \;

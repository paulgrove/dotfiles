#!/bin/bash

try_source () {
	[ -f $1 ] && source $1
}

try_source /etc/profile.d/apps-bin-path.sh
try_source $HOME/.dot-files/shell/paths.sh

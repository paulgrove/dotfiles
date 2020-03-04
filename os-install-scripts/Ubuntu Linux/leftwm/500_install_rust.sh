#!/bin/bash

if ! which rustc; then
	if -d $HOME/.cargo/bin; then
		export PATH=$PATH:$HOME/.cargo/bin
	else
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
		export PATH=$PATH:$HOME/.cargo/bin
	fi
fi

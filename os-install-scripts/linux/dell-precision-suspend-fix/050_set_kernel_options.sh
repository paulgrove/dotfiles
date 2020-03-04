#!/bin/bash

if which kernelstub; then
	sudo kernelstub -a rcutree.rcu_idle_gp_delay=1
	sudo kernelstub -a mem_sleep_default=deep
fi

if [ -f /etc/default/grub ]; then
	@echo Add the following options to GRUB_CMDLINE_LINUX_DEFAULT:
	@echo rcutree.rcu_idle_gp_delay=1
	@echo mem_sleep_default=deep
	read -n 1 -s -r -p "Press any key to continue"
	sudo vi /etc/default/grub
	sudo update-grub
fi

#!/usr/bin/env bash
# ------------------------------------------------------------------
# Script  : termux-starter-install.sh
# Desc    : termux-starter installer
# Version : 1.0
# Autor   : ghostkill73 <github.com/ghostkill73>
# Date    : 2024/02/24
# Info    : termux 0.118
# ------------------------------------------------------------------
# Use     : bash termux-starter-install.sh
# ------------------------------------------------------------------
# License : Intellectual property does not exist.
# Product free for changes, distribution and sale.
# It is not necessary to ask the author for permission.
# I am not responsible for misuse.
# --------------------------------------------------------------------------------

# Var
tvar1="bash.bashrc" # autorun script
tcmd="bash ~/termux-starter/termux-starter.sh"
twarn="termux-starter is already installed, installation interrupted."

# find bash.bashrc
	echo "starting installation..."
	sleep 3
	echo "autorun defined in -> $tvar1"
	sleep 1
	
if [[ -e /data/data/com.termux/files/usr/etc/$tvar1 ]]; then 
	echo -e "\e[38;2;0;255;0m$tvar1 located\e[0m"
	sleep 1
else
	echo -e "\e[38;2;255;0;0m$tvar1 was not located\e[0m" && exit 1
fi

# verify script
if grep -q "$tcmd" "/data/data/com.termux/files/usr/etc/$tvar1"; then
	echo -e "\e[38;2;255;255;0m($tcmd) found on $tvar1"
	echo -e "\e[38;2;255;255;0m$twarn\e[0m"
	exit 2
fi

# install and verify
	echo "inserting script..."
	echo "$tcmd" >> /data/data/com.termux/files/usr/etc/$tvar1
	sleep 1
	
if grep -q "$tcmd" "/data/data/com.termux/files/usr/etc/$tvar1"; then
	echo -e "\e[38;2;0;255;0mtermux-starter installed!\e[0m"
	sleep 3
else
	echo -e "\e[38;2;255;0;0msome error occurred.\e[0m" && exit 3
fi

# starting
	bash termux-starter.sh
# end
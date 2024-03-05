#!/usr/bin/env bash
# --------------------------------------------------------------------------------
# Script  : termux-starter.sh
# Version : 1.0
# Autor   : ghostkill73 <github.com/ghostkill73>
# Date    : 2024/03/05
# Info    : termux 0.118
# --------------------------------------------------------------------------------
# Use     : set "bash ~/termux-starter/termux-starter.sh" -> bash.bashrc
# or use termux-starter-install.sh
# --------------------------------------------------------------------------------
# License : Intellectual property does not exist.
# Product free for changes, distribution and sale.
# It is not necessary to ask the author for permission.
# I am not responsible for misuse.
# --------------------------------------------------------------------------------

# var
tmenu="\e[38;2;240;0;0m
	  @@@			\e[0mtermux v$TERMUX_VERSION pid:$TERMUX_APP_PID
\e[38;2;225;0;0m            @@@			\e[0m$(getprop ro.product.manufacturer) $(getprop ro.product.model) android:$(getprop ro.build.version.release)
\e[38;2;210;0;0m              @@@		\e[0m$USER@$HOSTNAME
\e[38;2;195;0;0m                @@@
\e[38;2;180;0;0m              @@@
\e[38;2;165;0;0m            @@@
\e[38;2;150;0;0m          @@@       @@@@@@@\e[0m
"

# start
clear
echo -e "$tmenu"
while true; do
	read -p "update apt/pkg? (y/n): " update
	case $update in
	 y)
		apt update -y && apt upgrade -y
		[[ $? -eq 0 ]] && echo -e "\e[38;2;0;255;0m apt updated sucessfully!\e[0m" || echo -e "\e[38;2;240;0;0m apt update fail\e[0m" 

		pkg update -y && pkg upgrade -y
		[[ $? -eq 0 ]] && echo -e "\e[38;2;0;255;0m pkg updated sucessfully!\e[0m" || echo -e "\e[38;2;240;0;0m pkg update fail\e[0m"
		exit 0
		;;
	 n)
		exit 0
		;;
	 *)
		echo -e "\e[38;2;240;0;0m error, please try again.\e[0m"
		;;
	esac
done

#!/bin/bash
#title           :install.sh
#description     :installer for manga-dl2
#author          :41M3
#start date      :12 APR. 2018
#version         :1
#usage           :sudo ./install.sh
#notes           :
#bash_version    :4.4.19
#==============================================================================
clear
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 0
fi
echo -e "\033[1m\033[44m MANGA-DL upgrader \033[0m\\n"
sleep 1s

CHOICE=-1

yes_no () {
    local CHOSEN='0'
    local ANSWER
    while [ "$CHOSEN" = '0' ]
    do
	read -p "$1 [Y/N]" -n1 ANSWER
	echo ''
	case $ANSWER in
	    y | Y )
		CHOICE=1
		CHOSEN='1';;
	    n | N )
		CHOICE=0
		CHOSEN='1';;
	    *)
		echo 'Invalid answer, try again.';;
	esac
    done
}

yes_no "UPGRADING manga-dl ?"
if [[ $CHOICE = 0 ]]; then
    echo "Upgrade aborted"
    exit
fi

#Install
cp src/manga-dl.1 /usr/share/man/man1/manga-dl2.1
chmod +x /src/manga-dl2
cp src/manga-dl2 /usr/bin/manga-dl2
echo -e "\e[1m\e[101m      Finished upgrade !      \e[0m"
sleep 1s
exit 0

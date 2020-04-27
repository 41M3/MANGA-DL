#!/bin/bash
#title           :install.sh
#description     :installer for manga-dl3
#author          :41M3
#start date      :27 APR. 2020
#version         :2
#usage           :./upgrade.sh
#notes           :
#bash_version    :4.4.19
#==============================================================================
clear
echo -e "\033[1m\033[44m MANGA-DL upgrader \033[0m\\n"
sleep 1s

CHOICE=-1

yes_no () {
    local CHOSEN='0'
    local ANSWER
    while [[ "$CHOSEN" = '0' ]]
    do
	read -p "$1 [Y/N]" -n1 ANSWER
	echo ''
	case ${ANSWER} in
	    y | Y ) CHOICE=1 CHOSEN='1';;
	    n | N ) CHOICE=0 CHOSEN='1';;
	    *) echo 'Invalid answer, try again.';;
	esac
    done
}

yes_no "UPGRADING manga-dl ?"
if [[ ${CHOICE} = 0 ]]; then
    echo "Upgrade aborted"
    exit
fi

#Install
chmod +x src/manga-dl3 src/color/changecolor

cp src/manga-dl3 $HOME/.bin/manga-dl3
cp -r src/color $HOME/.bin/color

#cp src/manga-dl.1 /usr/share/man/man1/manga-dl2.1

echo -e "\e[1m\e[101m      Finished upgrade !      \e[0m"
exit 0

#!/bin/bash
#title           :install.sh
#description     :installer for manga-dl3
#author          :41M3
#start date      :27 APR. 2020
#version         :1
#usage           :./install.sh
#notes           :
#bash_version    :4.4.19
#==============================================================================
clear
#if [[ $EUID -ne 0 ]]; then
#    echo "This script must be run as root" 1>&2
#    exit 0
#fi

CHOICE=-1

yes_no () {
    local CHOSEN='0'
    local ANSWER
    while [[ "$CHOSEN" = '0' ]]
    do
        read -p "$1 [Y/N]" -n1 ANSWER
        echo ''
        case $ANSWER in
            y | Y ) CHOICE=1 CHOSEN='1';;
            n | N ) CHOICE=0 CHOSEN='1';;
            *) echo 'Invalid answer, try again.';;
        esac
    done
}

echo -e "\e[1m\e[101m Welcome on this installation script made by 41M3!  \e[0m"
sleep 1s
yes_no "Start INSTALLATION of manga-dl ?"
if [[ $CHOICE = 0 ]]; then
    echo "Installation aborted..."
    exit
fi

if [[ -e $HOME/.bin ]]; then
    chmod +x src/manga-dl3 src/color/changecolor
    cp src/manga-dl3 ~/.bin/manga-dl3
    cp -r src/color ~/.bin/color
else
    mkdir $HOME/.bin
    echo "export PATH=\$PATH:\$HOME/.bin" >> $HOME/.zshrc
    echo "export PATH=\$PATH:\$HOME/.bin" >> $HOME/.bashrc
    chmod +x src/manga-dl3 src/color/changecolor
    cp src/manga-dl3 ~/.bin/manga-dl3
    cp -r src/color ~/.bin/color
fi

#cp src/man/manga-dl.1 /usr/share/man/man1/manga-dl.1

echo -e "\e[1m\e[101m      Finihed installation !      \e[0m"
exit 0

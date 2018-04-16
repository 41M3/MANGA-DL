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

CHOICE=-1

yes_no () {
    local CHOSEN='0'
    local ANSWER
    while [[ "$CHOSEN" = '0' ]]
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

echo -e "\e[1m\e[101m Welcome on this installation script made by 41M3!  \e[0m"
sleep 1s
yes_no "Start INSTALLATION of manga-dl ?"
if [[ $CHOICE = 0 ]]; then
    echo "Installation aborted..."
    exit
fi
chmod +x src/manga-dl2
cp src/manga-dl2 /usr/bin/manga-dl2
cp src/manga-dl.1 /usr/share/man/man1/manga-dl.1
echo -e "\e[1m\e[101m      Finihed installation !      \e[0m"
sleep 1s
exit 0

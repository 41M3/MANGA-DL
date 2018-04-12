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

clear
echo -e "\e[1m\e[101m  You are not welcome on this uninstall script made by 41M3!  \e[0m"
sleep 1s
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 0
fi
yes_no "Start INSTALLATION of manga-dl [Y/N] ?"
if [ $CHOICE = 0 ]; then
    echo "Installation aborted..."
    exit
fi
cp src/manga-dl.1 /usr/share/man/man1/manga-dl2.1
cp src/manga-dl2 /usr/bin/manga-dl2
echo -e "\e[1m\e[101m      INSTALLATION ENDED !      \e[0m"
sleep 5
exit 0

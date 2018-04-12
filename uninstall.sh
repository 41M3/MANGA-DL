#!/bin/bash
#title           :uninstall.sh
#description     :uninstaller for manga-dl2
#author          :41M3
#start date      :12 APR. 2018
#version         :1
#usage           :sudo ./uninstall.sh
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
sleep 3s
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 0
fi
yes_no "Start UNINSTALLATION of manga-dl ?"
if [ $CHOICE = 0 ]; then
    echo "Uninstallation aborted, WELL!!!"
    exit
fi
rm /usr/bin/manga-dl*
#rm /usr/share/man/man1/manga-dl*
echo -e "\e[1m\e[101m     UNINSTALLATION ENDED !      \e[0m"
sleep 5s
exit 0

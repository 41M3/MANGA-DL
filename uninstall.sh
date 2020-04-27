#!/bin/bash
#title           :uninstall.sh
#description     :uninstaller for manga-dl3
#author          :41M3
#start date      :27 APR. 2020
#version         :1
#usage           :./uninstall.sh
#notes           :
#bash_version    :4.4.19
#==============================================================================
clear

CHOICE=-1

yes_no () {
    local CHOSEN='0'
    local ANSWER
    while [ "$CHOSEN" = '0' ]
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

echo -e "\e[1m\e[101m  You are not welcome on this uninstall script made by 41M3!  \e[0m"
sleep 1s
yes_no "Start UNINSTALLATION of manga-dl ?"
if [[ $CHOICE = 0 ]]; then
    echo "Uninstallation aborted, WELL!!!"
    exit
fi
rm $HOME/.bin/manga-dl*
rm -rf $HOME/.bin/color/
#rm /usr/share/man/man1/manga-dl*
echo -e "\e[1m\e[101m     Finished uniinstallation :( !      \e[0m"
exit 0

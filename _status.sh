#! bin/bash


if [ $(ps -aux | grep push_intelligence.py | awk '{print $2}' | wc -l ) = 1 ]
    then
        echo " "
        echo " "
        echo -e "\e[0;31m App is inactive !\e[0m"
        echo " "
        echo " "
    else
        echo " "
        echo " "
        echo -e "\e[0;33m App is active !\e[0m"
        echo " "
        echo " "
fi

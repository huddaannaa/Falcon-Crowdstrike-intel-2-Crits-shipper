#! bin/bash


if [ $(ps -aux | grep push_intelligence.py | awk '{print $2}' | wc -l ) = 1 ]
    then
        echo " "
        echo " "
        echo -e "\e[0;33m| Turning on Application ... !\e[0m"
	echo -e "\e[0;33m| Processing ... \e[0m"
        echo " "
        echo " "
		sleep 1
		python2.7 -B Engine/push_intelligence.py &
		

		echo " "
		echo -e "\e[0;33m|/-``~^- Running >> ... \e[0m"
		sleep 1
        echo -e "\e[0;33m|==>>>>>>>>>>>>>|\e[0m"
        echo ""
        echo ""
	# tailf Reports/program_log
		
    else
        echo " "
        echo " "
        echo -e "\e[0;33m| App is already running!\e[0m"
        echo " "
        echo " "
fi





#! bin/bash

for u in $(ps -aux | grep push_intelligence.py | awk '{print $2}');do kill -9 $u; done > /dev/null 2>&1
sleep 1
echo ""
echo -e "\e[0;35m App Ended !\e[0m"
echo ""


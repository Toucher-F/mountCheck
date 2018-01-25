#!/bin/bash

mount="172.31.19.72:/mount/anlypg_bak"
check=$(df -Th)
result=$(echo $check | grep "${mount}")

if [[ "$result" != "" ]]
then
    echo "True"
else
    echo "False"
    coment="${mount} missing"
    echo -e "$coment" | mail -s "${hostname} Mount missing"  bill.duan@saninco.com
    exit 1
fi
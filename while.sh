#!/bin/bash

num=2

while [[  $num -le 5  ]]
do
    num=$((num+1))
    echo $num
done

while read -r line
do
    echo "$line"
done < source.txt

while read line; do
    echo "$line"
done < <(cat source.txt)

ps -ef | grep '/usr/sbin/' | while read -r line
do
    echo $line
    sleep 1
done
#!/bin/bash

echo 'Input ports to fake (ex: 22,80,443): '
read ports

ports_trated=${ports//','/' '}

echo 'Run nc with sudo ? (y/n)'
read sudo

if [ $sudo = 'y' ]
then
    sudo='sudo'
else
    sudo=''
fi

for port in $ports_trated
do
    $sudo nc -l -vv -n -k -p $port &
done
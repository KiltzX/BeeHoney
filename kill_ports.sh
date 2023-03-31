#!/bin/bash

echo 'Input ports to kill (ex: 22,80,443): '
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
    $sudo kill -9 `sudo lsof -t -i:$port`
done
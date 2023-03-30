#!/bin/bash

echo 'Input ports to fake (ex: 22,80,443): '
read ports

ports_trated=${ports//','/' '}

for port in $ports_trated
do
    sudo nc -l -vv -n -k -p $port &
done
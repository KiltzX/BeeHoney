#!/bin/bash

echo 'Input ports to kill (ex: 22,80,443): '
read ports

ports_trated=${ports//','/' '}

for port in $ports_trated
do
    sudo kill -9 `sudo lsof -t -i:$port`
done
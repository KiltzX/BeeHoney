#!/bin/bash

echo "Install Docker ? (y/N)"
read install

if $install == "y" || $install == "Y"
then
    echo "Installing Docker..."
    sudo apt-get update -y
    sudo apt-get install ca-certificates curl gnupg -y

    sudo mkdir -m 0755 -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


echo "Test Docker"
sudo docker run hello-world


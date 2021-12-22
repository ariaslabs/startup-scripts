#!/bin/bash

#  
# Setup script for Ubuntu based distros
# Author: ariaslabs
# version: 1
#

echo "Starting up new enviroment: Ubuntu."
sudo apt-get update -y
sudo apt-get upgrade -y

#download array via apt
"Adding main packages"
devitems=(node python3 pip git wget nmap deno docker docker-ce docker-ce-cli containerd.io software-properties-common apt-transport-https)

for item in devitems
do
    sudo apt install $item -y
done

#Npm/Yarn packages
"Adding npm/yarn packages"
sudo npm i -g yarn
yarn global add @vue/cli
yarn global add nodemon
yarn global add electron@latest

#Add Git Configs
echo "Adding Git Configs"
git config --global user.name "Christopher Arias"
git config --global user.email christopher.arias.jr@gmail.com

#Docker setup
echo "Testing Docker"
sudo docker run hello-world

#Add Gui Applications
echo "Adding VScode"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo apt install code -y
echo "Adding Spotify"
flatpak install flathub com.spotify.Client -y
echo "Adding Discord"
flatpak install flathub com.discordapp.Discord -y
echo "Adding Telegram"
flatpak install flathub org.telegram.desktop -y
echo "Adding Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm -rf ./google-chrome-stable_current_amd64.deb
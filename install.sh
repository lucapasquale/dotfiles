#!/usr/bin/env bash

# Basics
sudo apt install -y git curl jq fonts-firacode

############################################
#                 VSCode
############################################
echo "Installing VSCode..."

sudo apt update
sudo apt install software-properties-common apt-transport-https wget

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt install -y code

###########################################
#               Node.js
###########################################
echo "Installing Node.js"

# Node
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Global packages
sudo npm install -g n nodemon eslint tslint prettier
sudo npm install --unsafe-perm -g ngrok

# Use Node.js LTS version
sudo n lts

############################################
#               Databases
############################################
echo "Installing databases..."

# Redis
sudo apt update && sudo apt install -y redis-server
sudo sed -i 's/supervised no/supervised systemd/g' /etc/redis/redis.conf
sudo systemctl restart redis.service

############################################
#          Oh My Zsh and plugins
############################################
echo "Installing Oh-My-Zsh..."

# ZSH
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Plugins
sudo apt-get install git-extras
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

############################################
#                 Tools
############################################
echo "Installing tools..."

# Insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y insomnia

# Ripgrep
sudo apt-get install ripgrep


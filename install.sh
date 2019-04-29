#!/usr/bin/env bash

# Basics
sudo apt install git curl fonts-firacode -y

############################################
#                 VSCode
############################################
echo "Installing VSCode..."

sudo apt update
sudo apt install software-properties-common apt-transport-https wget

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt install code -y

###########################################
#               Node.js
###########################################
echo "Installing Node.js"

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y

############################################
#          Oh My Zsh and plugins
############################################
echo "Installing Oh-My-Zsh..."

# ZSH
sudo apt install zsh

# Oh-my-zsh
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Plugins
sudo apt-get install git-extras
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cp .zshrc ~/.zshrc

############################################
#                 Insomnia
############################################
echo "Installing Insomnia..."

echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt-get update && sudo apt-get install insomnia -y

############################################
#                 Tools
############################################
echo "Installing tools..."

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Cat
sudo dpkg -i bat_0.10.0_amd64.deb

# Ripgrep
sudo apt-get install ripgrep


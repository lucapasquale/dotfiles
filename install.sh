#!/usr/bin/env bash
USER_NAME=luca;

# Basics
sudo apt-get install -y git curl jq xclip fonts-firacode
rm -rf /home/$USER_NAME/.gitconfig && ln -s $PWD/.gitconfig /home/$USER_NAME/.gitconfig

############################################
#          Oh My Zsh and plugins
############################################
echo ""
echo "Installing Oh-My-Zsh..."

# ZSH
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
rm -rf /home/$USER_NAME/.zshrc && ln -s $PWD/.zshrc /home/$USER_NAME/.zshrc

# Plugins
sudo apt-get install -y git-extras
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

###########################################
#               Node.js
###########################################
echo ""
echo "Installing Node.js"

# Node
curl -L https://git.io/n-install | bash -s -- -y

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Global packages
npm install -g typescript n nodemon eslint prettier
npm install --unsafe-perm -g ngrok

############################################
#                 Tools
############################################
echo ""
echo "Installing tools..."

# # Docker
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER_NAME

# Insomnia
sudo snap install insomnia

# Spotify
sudo snap install spotify

# Tmux
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -rf /home/$USER_NAME/.tmux.conf && ln -s $PWD/.tmux.conf /home/$USER_NAME/.tmux.conf

# AWS CLI
sudo apt-get install -y awscli

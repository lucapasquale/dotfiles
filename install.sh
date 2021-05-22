#!/usr/bin/env bash
USER_NAME=luca;

# Basics
sudo apt-get install -y git curl jq fonts-firacode
rm -rf /home/$USER_NAME/.gitconfig && ln -s $PWD/.gitconfig /home/$USER_NAME/.gitconfig

############################################
#          Oh My Zsh and plugins
############################################
echo ""
echo "Installing Oh-My-Zsh..."

# ZSH
sudo apt-get install -y zsh bat fzf
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
rm -rf /home/$USER_NAME/.zshrc && ln -s $PWD/.zshrc /home/$USER_NAME/.zshrc

# Plugins
sudo apt-get install -y git-extras
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

###########################################
#               Node.js
###########################################
echo ""
echo "Installing Node.js"

# Node
asdf plugin-add nodejs
asdf install nodejs latest:14
asdf global nodejs latest:14

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Global packages
npm install -g typescript nodemon eslint prettier ngrok

############################################
#                 Tools
############################################
echo ""
echo "Installing tools..."

# Tmux
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -rf /home/$USER_NAME/.tmux.conf && ln -s $PWD/.tmux.conf /home/$USER_NAME/.tmux.conf

# AWS CLI
sudo apt-get install -y awscli

#!/usr/bin/env bash

# basics
sudo apt-get install -y git curl jq fonts-firacode
rm -rf ~/.gitconfig && ln -s $PWD/.gitconfig ~/.gitconfig


###########################################
#               Node.js
###########################################

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

# node
asdf plugin-add nodejs
asdf install nodejs latest:14

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# global packages
npm install -g typescript nodemon eslint prettier ngrok


############################################
#          Oh My Zsh and plugins
############################################

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-update-rc

# zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
rm -rf ~/.zshrc && ln -s $PWD/.zshrc ~/.zshrc

# plugins
sudo apt-get install -y git-extras
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k


############################################
#                 Tools
############################################

# tmux
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -rf ~/.tmux.conf && ln -s $PWD/.tmux.conf ~/.tmux.conf

# aws cli
sudo apt-get install -y awscli

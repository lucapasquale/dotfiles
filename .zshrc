# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="refined"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-extras
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='code'

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"

# Staging helpers
alias yarn-staging="source ~/.env-vars/staging.sh"
alias yarn-staging-js="yarn-staging && nodemon --exec \"yarn start\""
alias yarn-staging-ts="yarn-staging && nodemon --watch 'src/**/*.ts' --ignore 'src/**/*.spec.ts' --exec 'ts-node' src/index.ts"

# Git helpers
alias git-cleanup="git fetch -p && git removed-branches -f --prune"
alias git-checkpoint="gaa && gc -m \"checkpoint\" && gp"

# Other helpers
alias cat=bat
alias grep=rg

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH config
export ZSH=$HOME/.oh-my-zsh

plugins=(
  git
  git-extras
  asdf
  fzf
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='code'

# Paths
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

# Git helpers
alias git-cleanup="git fetch -p && git removed-branches -f --prune"
alias git-checkpoint="gaa && gc -m \"checkpoint\" --no-verify && gp"
alias git-merge-to-current-branch=merge_to_current_branch
merge_to_current_branch() {
  CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
  git fetch origin $1
  gco $CURRENT_BRANCH
  GIT_MERGE_AUTOEDIT=no git merge $1
}

# Plugins
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fixes slow copy-paste
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Start starship
eval "$(starship init zsh)"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
plugins=(
  git
  git-extras
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

# Staging helpers
[[ -f ~/.env-vars/staging.sh ]] && source ~/.env-vars/staging.sh
alias yarn-staging-js="yarn-staging nodemon --exec \"yarn start\""
alias yarn-staging-ts="yarn-staging nodemon --watch src -e ts --ignore 'src/**/*spec.ts' --exec 'yarn build && yarn start'"

# Git helpers
merge_to_current_branch() {
  CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
  gco $1 && gl
  gco $CURRENT_BRANCH
  gm $1
}
alias git-merge-to-current=merge_to_current_branch
alias git-cleanup="git fetch -p && git removed-branches -f --prune"
alias git-checkpoint="gaa && gc -m \"checkpoint\" && gp"

# LivUp
source $HOME/livupvenv/bin/activate
export LIVUP_HOME=$HOME/livup
alias robo3t=~/Apps/Robo-3T/bin/robo3t

source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH config
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  git-extras
  asdf
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

# Load work profile
[[ -f ~/.work/profile.sh ]] && source ~/.work/profile.sh

# Git helpers
alias git-cleanup="git fetch -p && git removed-branches -f --prune"
alias git-checkpoint="gaa && gc -m \"checkpoint\" --no-verify && gp"
alias git-merge-to-current-branch=merge_to_current_branch
merge_to_current_branch() {
  CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
  gco $1 && gl
  gco $CURRENT_BRANCH
  GIT_MERGE_AUTOEDIT=no git merge $1
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Plugins
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

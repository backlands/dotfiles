#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Setup ZSH NVM
export NVM_AUTO_USE=true
source ~/.zshplugs/zsh-nvm/zsh-nvm.plugin.zsh

# Ensure our custom themes will be found
fpath=( ~/.zpreztothemes "${fpath[@]}" )

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export TERM='xterm'

#ZLE_RPROMPT_INDENT=0
alias vim="nvim"
alias vi="nvim"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# Output my MOTD
source "$HOME/.config/scripts/motd.sh"

function gitCleanLocalBranches {
  DEVELOP="$1"
  if [ -z "$DEVELOP" ]; then
    DEVELOP="develop"
  fi
  git checkout "$DEVELOP" && git pull && git branch -d $(git branch --merged | grep -v 'master\|release-\|develop\|demo\|staging')
}

function gitCleanRemoteBranches {
  DEVELOP="$1"
  if [ -z "$DEVELOP" ]; then
    DEVELOP="develop"
  fi
  git checkout "$DEVELOP" && git pull && git push --delete origin $(git branch -a --merged | grep origin | grep -v 'master\|release-\|develop\|demo\|staging\|HEAD' | sed 's/remotes\/origin\///')
}


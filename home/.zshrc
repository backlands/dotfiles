#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#


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

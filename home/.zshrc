# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme to use, bullet-train is slick.
ZSH_THEME="bullet-train"

# Autostart tmux at login.
ZSH_TMUX_AUTOSTART="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Custom theme path.
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# List of plugins to install, no commas.
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux history-substring-search last-working-dir)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor
export EDITOR='vim'

# Program aliases
alias vomit="vim"
alias fuck="sudo !!"

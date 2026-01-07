# == define the default programs ==
export EDITOR="nvim"
export TERM="kitty"
export TERMINAL="kitty"
export BROWSER="zen-browser"
export FILE_MANAGER="thunar"


# == XDG Base Directory ==
# following the XDG Base Directory specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"


# == Paths ==
# define the path of binaries
export PATH="$PATH:/home/azmaan/.local/bin"

# define the config directory for starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
# define the cache directory for starship
export STARSHIP_CACHE="$XDG_CONFIG_HOME/starship/"

# == Options ==
# -- History Options --
HISTSIZE=7500
SAVEHIST=7500
HISTCONTROL=ignoreboth

# define the custom path for ZSH's history file
HISTFILE="$XDG_CACHE_HOME/zsh_history"

# == Load zsh-syntax-highlighting and zsh-autosuggestions ==
# Load zsh-syntax-highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Load zsh-autosuggestions
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi



# == Other Files ==
# source your aliases
# source $XDG_CONFIG_HOME/oh-my-zsh/aliases.zsh

# System - eza
alias ls='eza --no-user --no-time --no-permissions --icons=always'
alias ll='eza -la --no-user --no-time --no-permissions --icons=always'
alias lt='eza -T --icons=always'

alias nv="nvim"


# == Source Other Programs ==
# set up fzf
source <(fzf --zsh)
# set up zoxide
eval "$(zoxide init --cmd cd zsh)"
# set up starship
eval "$(starship init zsh)"

# opencode
export PATH=/home/azmaan/.opencode/bin:$PATH

# gemini
export GEMINI_API_KEY="I cannot show you this!!! xD"

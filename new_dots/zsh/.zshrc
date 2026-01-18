# == Default Programs ==
export EDITOR="nvim"
export TERM="kitty"
export TERMINAL="kitty"
export BROWSER="zen-browser"
export FILE_MANAGER="thunar"


# == XDG Base Directory ==
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"


# == Paths ==
export PATH="$PATH:/home/azmaan/.local/bin"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$XDG_CONFIG_HOME/starship/"

# == Options ==
HISTSIZE=7500
SAVEHIST=7500
HISTCONTROL=ignoreboth
HISTFILE="$XDG_CACHE_HOME/zsh_history"

# == Load zsh-syntax-highlighting and zsh-autosuggestions ==
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# == Source Other Programs ==
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"


# == Aliases ==
# System - eza
alias ls='eza --no-user --no-time --no-permissions --icons=always'
alias ll='eza -la --no-user --no-time --no-permissions --icons=always'
alias lt='eza -T --icons=always'

alias nv="nvim"

alias t="$HOME/.config/tmux/scripts/tmux_startup.sh"

# == Keybindings ==
# use control + left / right arrow key to move cursor
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# use home / end keys to move cursor to beginning / end of line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

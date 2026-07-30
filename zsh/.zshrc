# Default Programs
export EDITOR="nvim"
export TERM="kitty"
export TERMINAL="kitty"
export BROWSER="zen-browser"
export FILE_MANAGER="thunar"


# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"


# Paths
export PATH="$PATH:$HOME/.local/bin"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME_HOME/starship/"


# Options
HISTSIZE=7500
SAVEHIST=7500
HISTCONTROL=ignoreboth
HISTFILE="$XDG_CACHE_HOME/zsh_history"

# Load zsh completion system
autoload -Uz compinit
compinit

# Load zsh-syntax-highlighting and zsh-autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# Source Other Programs
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"


# FZF Customisations

# FZF - FD helper variable to exclude directories
FZF_FD_EXCLUDE="--exclude .git --exclude .cache --exclude node_modules --exclude .venv --exclude venv"

# FZF default options when running `fzf` command (basically appearance)
export FZF_DEFAULT_OPTS="--height 85% --layout=reverse --border=rounded"
# FZF default command when running `fzf` ==> uses `fd` as a `find` replacement
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix $FZF_FD_EXCLUDE"
# FZF command history --> removal of shell history event numbers
export FZF_CTRL_R_OPTS="--with-nth=2.."
# FZF file search options ==> uses `bat` as a better `cat` replacement
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :200 {}'"
# FZF file search command ==> reuses FZF_DEFAULT_COMMAND (same excludes, no duplication)
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# FZF folder search options ==> uses `eza` with tree flag, depth-capped for performance
export FZF_ALT_C_OPTS="--preview 'eza -T --level=2 --color=always --icons=always {} | head -200'"
# FZF folder search command ==> directories only, same exclude list as default
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix $FZF_FD_EXCLUDE"


# Aliases

# system tools
alias ls='eza --no-user --no-time --no-permissions --icons=always'
alias ll='eza -la --no-user --no-time --no-permissions --icons=always'
alias lt='eza -T --all --icons=always'

# terminal applications
alias nv="nvim"

# functions
alias t="$HOME/.config/tmux/scripts/tmux_startup.sh"

# Keybindings

# use control + left / right arrow key to move cursor
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# use home / end keys to move cursor to beginning / end of line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line


# Applications - Enviroments

# UV package manager
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

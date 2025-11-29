# -----------------------------
# Powerlevel10k Instant Prompt
# -----------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------
# Environment Setup
# -----------------------------
export HOME="/home/sameer"
export ZSH="$HOME/.oh-my-zsh"

# Path
export PATH="$PATH:$HOME/.local/bin"

# -----------------------------
# Theme & Plugins
# -----------------------------
ZSH_THEME="powerlevel10k/powerlevel10k"

# Custom plugins
source $HOME/.dotfiles/zsh/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.dotfiles/zsh/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# -----------------------------
# Aliases
# -----------------------------
# Example custom aliases
alias ll="ls -lh --color=auto"
alias la="ls -lha --color=auto"
alias grep="grep --color=auto"

# Alacritty-specific: open new tab/window from terminal
alias term="alacritty &>/dev/null &"

# Default SSH (no Kitty)
alias ssh="ssh -o ServerAliveInterval=60"

# -----------------------------
# Editor
# -----------------------------
export EDITOR="nvim"

# -----------------------------
# Powerlevel10k Config
# -----------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------------
# Misc
# -----------------------------
# Uncomment if needed
# ENABLE_CORRECTION="true"
# HIST_STAMPS="yyyy-mm-dd"
#
export TERM=xterm-256color

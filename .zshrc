# -----------------------------------------------------------------------------
# Oh My Zsh Configuration
# -----------------------------------------------------------------------------
# Sets up Oh My Zsh environment and themes.
export ZSH="$HOME/.oh-my-zsh"

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

plugins=(git web-search zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Aliases for reloading and editing zsh configuration.
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Enables completion using arrow keys (based on history).
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# -----------------------------------------------------------------------------
# Node Version Manager (NVM) Configuration
# -----------------------------------------------------------------------------
# Sets up NVM for managing different Node.js versions.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Loads bash_completion

# -----------------------------------------------------------------------------
# FZF Configuration (Fuzzy Finder)
# -----------------------------------------------------------------------------
# Sets up FZF key bindings and fuzzy completion.
eval "$(fzf --zsh)"

# Sets up FZF theme and default options.
export FZF_DEFAULT_OPTS="--color=fg:#CBE0F0,bg:#011628,hl:#B388FF,fg+:#CBE0F0,bg+:#143652,hl+:#B388FF,info:#06BCE4,prompt:#2CF9ED,pointer:#2CF9ED,marker:#2CF9ED,spinner:#2CF9ED,header:#2CF9ED"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Defines functions for FZF preview customization.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of FZF options via _fzf_comprun function.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'" "$@" ;;
    ssh)          fzf --preview 'dig {}' "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# -----------------------------------------------------------------------------
# Bat Configuration
# -----------------------------------------------------------------------------
# Sets up Bat (a cat clone with syntax highlighting) theme.
export BAT_THEME="Catppuccin Macchiato"

# -----------------------------------------------------------------------------
# Eza Configuration
# -----------------------------------------------------------------------------
# Aliases for ls command with icons.
alias ls="eza --icons=always"

# -----------------------------------------------------------------------------
# TheFuck Configuration
# -----------------------------------------------------------------------------
# Defines aliases for TheFuck command correction tool.
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# -----------------------------------------------------------------------------
# Zoxide Configuration
# -----------------------------------------------------------------------------
# Initializes Zoxide for better directory navigation.
eval "$(zoxide init zsh)"
alias cd="z"

# -----------------------------------------------------------------------------
# Custom Aliases and Functions
# -----------------------------------------------------------------------------

# Set up an alias for work sessions
alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/tomato.png'\
        -sound Crystal"
# Set up an alias for rest periods
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/tomato.png'\
        -sound Crystal"
# Use Neovim as the default editor instead of Vim
alias vim="nvim"

# -----------------------------------------------------------------------------
# FZF Customizations
# -----------------------------------------------------------------------------
# Sets up FZF preview options for specific commands.
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of FZF options via _fzf_comprun function.
# The first argument to the function is the name of the command.
# You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'" "$@" ;;
    ssh)          fzf --preview 'dig {}' "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# -----------------------------------------------------------------------------
# Eza Aliases
# -----------------------------------------------------------------------------
# Additional alias for 'ls' command with enhanced features.
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

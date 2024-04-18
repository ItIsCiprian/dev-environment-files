# -----------------------------------------------------------------------------
# Powerlevel10k Instant Prompt Configuration
# -----------------------------------------------------------------------------
# Enables faster shell startup by using the Powerlevel10k instant prompt feature.
# Ensure initialization requiring console input is placed before this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------
# Oh My Zsh Configuration
# -----------------------------------------------------------------------------
# Set up Oh My Zsh environment and themes.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"  # Modern, customizable Zsh theme
plugins=(git web-search zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# Node Version Manager (NVM) Configuration
# -----------------------------------------------------------------------------
# Setup for managing different Node.js versions.
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # Load NVM
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # Load bash_completion

# -----------------------------------------------------------------------------
# Path Configuration
# -----------------------------------------------------------------------------
# Customize system $PATH to ensure custom binaries and tools are available.
export PATH="$HOME/.tmuxifier/bin:/usr/local/opt/curl/bin:$PATH"

# -----------------------------------------------------------------------------
# FZF Configuration (Fuzzy Finder)
# -----------------------------------------------------------------------------
# FZF settings for enhanced command-line navigation and previews.
source ~/fzf-git.sh/fzf-git.sh
export FZF_DEFAULT_OPTS="--color=fg:#CBE0F0,bg:#011628,hl:#B388FF,fg+:#CBE0F0,bg+:#143652,hl+:#B388FF,info:#06BCE4,prompt:#2CF9ED,pointer:#2CF9ED,marker:#2CF9ED,spinner:#2CF9ED,header:#2CF9ED"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}" "$@" ;;
    ssh)          fzf --preview 'dig {}' "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# -----------------------------------------------------------------------------
# User Custom Aliases and Functions
# -----------------------------------------------------------------------------
# Custom aliases for productivity and system navigation.
alias work="timer 60m && terminal-notifier -message 'Pomodoro complete - Take a break' -title 'Work Timer' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"
alias rest="timer 10m && terminal-notifier -message 'Break over - Back to work' -title 'Break Timer' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"
alias vim="nvim"  # Use Neovim as the default editor
eval "$(zoxide init zsh)"  # Initialize zoxide for directory navigation
alias cd="z"  # Use zoxide for enhanced 'cd'

# -----------------------------------------------------------------------------
# Additional Tools Configuration
# -----------------------------------------------------------------------------
# Configuration for miscellaneous tools.
export BAT_THEME="tokyonight_night"  # Theme for Bat (a cat clone with syntax highlighting)
eval $(thefuck --alias)  # Command correction tool
eval $(thefuck --alias fk)

# Source Powerlevel10k theme customization, if exists.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

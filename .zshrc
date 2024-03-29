# -----------------------------------------------------------------------------
# Powerlevel10k Instant Prompt Configuration
# -----------------------------------------------------------------------------
# Enables faster shell startup by using the Powerlevel10k instant prompt feature.
# Ensure any initialization requiring console input is placed before this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------
# Environment Configuration
# -----------------------------------------------------------------------------
# Set the Zsh and Oh My Zsh environment variables.
export ZSH="$HOME/.oh-my-zsh"

# Node Version Manager (NVM) setup for managing different Node.js versions.
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # Load NVM
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # Load NVM bash_completion

# Tmuxifier initialization for managing tmux sessions.
export PATH="$HOME/.tmuxifier/bin:$PATH"

# -----------------------------------------------------------------------------
# Path Configuration
# -----------------------------------------------------------------------------
# Customize system $PATH to include directories with executable files, ensuring
# custom binaries and tools are available in the shell.
# Uncomment and modify the following line as needed.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Example: Add custom path for a newer version of curl.
export PATH="/usr/local/opt/curl/bin:$PATH"

# -----------------------------------------------------------------------------
# Oh My Zsh Theme and Plugin Configuration
# -----------------------------------------------------------------------------
# Configure the visual theme and functionality of the Oh My Zsh environment.

# Set the Zsh theme to Powerlevel10k for a modern, customizable prompt.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Optionally, enable random theme selection from a list of candidates.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Specify plugins to enhance shell capabilities, including suggestions,
# syntax highlighting, and command history search.
plugins=(git web-search zsh-autosuggestions zsh-syntax-highlighting)

# Source the main Oh My Zsh script to apply the theme and plugins.
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# User Configuration
# -----------------------------------------------------------------------------
# Define aliases, environment variables, and other custom settings for the user.

# Aliases for productivity, like starting a Pomodoro timer with notifications.
alias work="timer 60m && terminal-notifier -message 'Pomodoro' -title 'Work Timer is up! Take a Break 😊' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"
alias rest="timer 10m && terminal-notifier -message 'Pomodoro' -title 'Break is over! Get back to work 😬' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"

# Set 'vim' alias to use Neovim for an enhanced editing experience.
alias vim="nvim"

# -----------------------------------------------------------------------------
# Prompt Customization
# -----------------------------------------------------------------------------
# Instructions for customizing the command-line prompt appearance and behavior.

# To customize the prompt (e.g., with Powerlevel10k), run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

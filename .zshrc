# Powerlevel10k Instant Prompt Configuration
# Enables the Powerlevel10k instant prompt feature for a faster shell startup.
# Initialization requiring console input should precede this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path Configuration
# Customize the system $PATH variable to include directories with executable files.
# This is particularly useful if you're migrating from bash or have custom binaries.
export ZSH="$HOME/.oh-my-zsh"
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Oh My Zsh Configuration
# Specifies the Oh My Zsh theme, plugins, and update behavior.

# Theme Configuration
ZSH_THEME="powerlevel10k/powerlevel10k" # Set the Zsh theme to Powerlevel10k.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" ) # Optional: Random theme selection.

# Plugin Configuration
# Add plugins to enhance shell capabilities. Popular plugins include git, zsh-autosuggestions, and zsh-syntax-highlighting.
plugins=(git web-search zsh-autosuggestions zsh-syntax-highlighting)

# Source the Oh My Zsh script to apply the above configurations.
source $ZSH/oh-my-zsh.sh

# User Configuration
# Custom user settings for environment variables, aliases, and more.

# Aliases for productivity and convenience.
# Example: Aliases for starting a Pomodoro timer with notifications.
alias work="timer 60m && terminal-notifier -message 'Pomodoro' -title 'Work Timer is up! Take a Break 😊' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"
alias rest="timer 10m && terminal-notifier -message 'Pomodoro' -title 'Break is over! Get back to work 😬' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"

# Node Version Manager (NVM) Configuration
# Setup NVM for managing different Node.js versions.
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Additional Configuration
# Customize further as needed. Examples include setting the default editor or modifying the PATH.
alias vim="nvim" # Set 'vim' alias to use Neovim.
export PATH="/usr/local/opt/curl/bin:$PATH" # Add custom path, e.g., for a newer version of curl.

# Prompt Customization
# To customize the prompt (e.g., with Powerlevel10k), run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

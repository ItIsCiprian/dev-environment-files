My Dev Environment Files 🚀
IMPORTANT: These are primarily meant for inspiration. I wouldn't just blindly use them. Proceed at your own risk!

Terminal Setup
Relevant Files
.zshrc - Zsh Shell Configuration
coolnight.itermcolors - iTerm2 Color Scheme
Tmux Setup
Relevant Files
.tmux.conf - Tmux Configuration File
Yabai Tiling Window Manager Setup
Relevant Files
.config/yabai/yabairc
.config/skhd/skhdrc
Neovim Setup
Important: This is my latest config with lazy.nvim. It is similar, but not the same as my original packer setup.

📹 lazy.nvim Neovim in this repro in .config/nvim

If you clone the repo into your machine and use the config by copying .config/nvim to your home folder, wait for the plugins, language servers and parsers to install with lazy.nvim, Mason and nvim-treesitter. If you are opening a lua file or another file I have language servers configured for, like html, css or javascript/typescript, you might also get an error saying that the server failed to start. This is because Mason hasn't installed it yet. Press enter to continue, Mason will automatically install it.

Relevant Files
.config/nvim
Setup Requires
True Color Terminal Like: iTerm2
Neovim (Version 0.9 or Later)
Nerd Font - I use Meslo Nerd Font
Ripgrep - For Telescope Fuzzy Finder
XCode Command Line Tools
If working with typescript/javascript and the typescript language server like me. You might need to install node.
If you're on mac, like me, you can install iTerm2, Neovim, Ripgrep and Node with homebrew.

brew install --cask iterm2
brew install neovim
brew install ripgrep
brew install node
For XCode Command Line Tools do:

xcode-select --install
Plugins
Plugin Manager
folke/lazy.nvim - Amazing plugin manager
Dependency For Other Plugins
nvim-lua/plenary - Useful lua functions other plugins use
Preferred Colorscheme
bluz71/vim-nightfly-guicolors
Navigating Between Neovim Windows and Tmux
christoomey/vim-tmux-navigator
Essentials
tpope/vim-surround - manipulate surroundings with "ys", "ds", and "cs"
vim-scripts/ReplaceWithRegister - replace things with register with "gr"
numToStr/Comment.nvim - toggle comments with "gc"
File Explorer
nvim-tree/nvim-tree.lua
VS Code Like Icons
kyazdani42/nvim-web-devicons
Neovim Greeter
goolord/alpha-nvim
Status Line
nvim-lualine/lualine.nvim
Buffer Line
akinsho/bufferline.nvim
Keymap Suggestions
folke/which-key.nvim
Fuzzy Finder
nvim-telescope/telescope-fzf-native.nvim - Dependency for better performance
nvim-telescope/telescope.nvim - Fuzzy Finder
stevearc/dressing.nvim - select/input ui improvement
Marking Files With Prime's Harpoon
ThePrimeagen/harpoon
Autocompletion
hrsh7th/nvim-cmp - Completion plugin
hrsh7th/cmp-buffer - Completion source for text in current buffer
hrsh7th/cmp-path - Completion source for file system paths
onsails/lspkind.nvim - Vs Code Like Icons for autocompletion
Snippets
L3MON4D3/LuaSnip - Snippet engine
rafamadriz/friendly-snippets - Useful snippets for different languages
saadparwaiz1/cmp_luasnip - Completion source for snippet autocomplete
Managing & Installing Language Servers, Linters & Formatters
williamboman/mason.nvim
LSP Configuration
williamboman/mason-lspconfig.nvim - Bridges gap b/w mason & lspconfig
neovim/nvim-lspconfig - Easy way to configure lsp servers
hrsh7th/cmp-nvim-lsp - Smart code autocompletion with lsp
Formatting & Linting
jose-elias-alvarez/null-ls.nvim - Easy way to configure formatters & linters
jayp0521/mason-null-ls.nvim - Bridges gap b/w mason & null-ls
Syntax Highlighting & Autoclosing Things
nvim-treesitter/nvim-treesitter - Treesitter configuration
windwp/nvim-autopairs - Autoclose brackets, parens, quotes, etc...
windwp/nvim-ts-autotag - Autoclose tags
Git
lewis6991/gitsigns.nvim - Show line modifications on left hand side

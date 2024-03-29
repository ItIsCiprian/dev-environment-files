-- Plugin configuration for Neovim
-- This configuration sets up several plugins to enhance the Neovim experience,
-- focusing on utility, navigation, and editing enhancements.

return {
  -- Utility Plugins
  -- `nvim-lua/plenary.nvim` provides common Lua functions used by many plugins.
  { "nvim-lua/plenary.nvim" },

  -- Navigation Plugins
  {
    -- `vim-tmux-navigator` allows seamless navigation between tmux panes and Neovim splits.
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    -- Key mappings for tmux navigation: use Ctrl + [h/j/k/l] to navigate splits or tmux panes.
    -- Ctrl + \ to navigate to the previous pane or split.
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },      -- Left
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },      -- Down
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },        -- Up
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },     -- Right
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" }, -- Previous
    },
  },

  -- Editing Enhancements
  -- `vim-ReplaceWithRegister` offers an efficient way to replace text using the contents of a register.
  { "inkarkat/vim-ReplaceWithRegister" },

  -- `copilot.vim` introduces GitHub Copilot support for Neovim, providing AI-based code completions.
  { "github/copilot.vim" },
}

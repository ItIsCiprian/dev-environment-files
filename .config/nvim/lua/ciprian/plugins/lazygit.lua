return {
  -- Plugin specification for lazygit.nvim
  "kdheepak/lazygit.nvim",

  -- Commands to trigger the LazyGit plugin
  cmd = {
    "LazyGit", -- Open the LazyGit interface
    "LazyGitConfig", -- Open LazyGit configuration
    "LazyGitCurrentFile", -- Show LazyGit status for the current file
    "LazyGitFilter", -- Open LazyGit with a filter applied
    "LazyGitFilterCurrentFile", -- Filter LazyGit status for the current file
  },

  -- Optional dependencies for additional functionality
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for floating window border decoration
  },

  -- Keybindings to load the plugin on first use
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" }, -- Set <leader>lg to open LazyGit
  },
}

-- Configuration for 'kdheepak/lazygit.nvim', a Neovim integration for lazygit.
return {
  "kdheepak/lazygit.nvim",                -- Plugin identifier
  cmd = {                                 -- Commands that trigger loading of the plugin
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {                        -- Dependency required by the plugin
    "nvim-lua/plenary.nvim",
  },
  -- Key bindings are set here to delay plugin loading until needed
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },  -- Map <leader>lg to open LazyGit
  },
}

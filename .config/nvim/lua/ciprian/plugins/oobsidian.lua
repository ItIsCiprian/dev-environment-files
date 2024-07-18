-- Configuration for obsidian.nvim plugin
return {
  "epwalsh/obsidian.nvim",
  version = "*", -- Recommended: Use the latest release instead of the latest commit for stability
  lazy = true,   -- Load the plugin lazily
  ft = "markdown", -- Load the plugin for markdown file types

  -- Uncomment and replace the above 'ft' line with the below 'event' if you want to load obsidian.nvim
  -- only for markdown files within your vault
  -- event = {
  --   -- Use 'vim.fn.expand' to handle the home shortcut '~'
  --   -- E.g., "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },

  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency

    -- Add other optional dependencies below
  },

  opts = {
    -- Configuration for workspaces
    workspaces = {
      {
        name = "personal",
        path = "~/Users/ionutcipriananescu/Library/Mobile Documents/iCloud~md~obsidian/Documents",
      },
      {
        name = "work",
        path = "~/Users/ionutcipriananescu/Library/Mobile Documents/iCloud~md~obsidian/Documents",
      },
    },

    -- Add other options below
  },
}

-- Configuration for the nvim-treesitter plugin
return {
  "nvim-treesitter/nvim-treesitter",            -- Plugin identifier
  event = { "BufReadPre", "BufNewFile" },       -- Trigger loading for these events
  build = ":TSUpdate",                          -- Command to build or update the plugin
  dependencies = {                              -- List of plugin dependencies
    "windwp/nvim-ts-autotag",                   -- Autotag plugin for automatic tag management
  },
  config = function()
    -- Load the nvim-treesitter configuration module
    local treesitter = require("nvim-treesitter.configs")

    -- Setup nvim-treesitter
    treesitter.setup({
      highlight = {                             -- Enable syntax highlighting
        enable = true,
      },
      indent = {                                -- Enable automatic indentation
        enable = true,
      },
      autotag = {                               -- Enable automatic tag management
        enable = true,
      },
      ensure_installed = {                      -- List of language parsers to install
        "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
        "prisma", "markdown", "markdown_inline", "svelte", "graphql",
        "bash", "lua", "vim", "dockerfile", "gitignore", "query",
        "vimdoc", "c",
      },
      incremental_selection = {                 -- Configure incremental selection
        enable = true,
        keymaps = {                             -- Key mappings for selection
          init_selection = "<C-space>",         -- Initialize selection
          node_incremental = "<C-space>",       -- Increment selection
          scope_incremental = false,            -- No scope increment key
          node_decremental = "<bs>",            -- Decrement selection
        },
      },
    })
  end,
}

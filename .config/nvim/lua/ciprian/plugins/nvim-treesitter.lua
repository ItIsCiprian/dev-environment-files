return {
  {
    -- Plugin Configuration
    "nvim-treesitter/nvim-treesitter", -- Plugin name
    event = { "BufReadPre", "BufNewFile" }, -- Trigger on these events
    build = ":TSUpdate", -- Command to update treesitter
    dependencies = {
      "windwp/nvim-ts-autotag", -- Additional plugin dependency
    },
    config = function()
      -- Import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- Configure treesitter
      treesitter.setup({
        -- Enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- Enable automatic indentation
        indent = { enable = true },
        -- Enable autotagging (with nvim-ts-autotag plugin)
        autotag = { enable = true },
        -- Ensure these language parsers are installed
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
        },
        -- Enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        -- Auto install above language parsers
        auto_install = true,
      })
    end,
  },
}

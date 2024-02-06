return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- Import the nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- Configure treesitter
      treesitter.setup({
        -- Enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- Enable indentation
        indent = { enable = true },
        -- Enable autotagging (w/ nvim-ts-autotag plugin)
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
        -- Auto install above language parsers
        auto_install = true,
      })

      -- Import and configure the ts_context_commentstring module
      local ts_commentstring = require("ts_context_commentstring")
      ts_commentstring.setup({})

      -- Set the global variable to speed up loading
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}

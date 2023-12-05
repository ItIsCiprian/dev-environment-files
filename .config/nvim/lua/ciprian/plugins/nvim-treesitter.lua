-- nvim treesitter config file for lsp (nvim-lspconfig)
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
      -- Import ts_context_commentstring plugin
      require("ts_context_commentstring").setup({})

      -- Set the flag to skip loading the deprecated module
      vim.g.skip_ts_context_commentstring_module = true

      -- Configure nvim-treesitter
      local treesitter = require("nvim-treesitter.configs")
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
        -- Auto install above language parsers
        auto_install = true,
      })
    end,
  },
}

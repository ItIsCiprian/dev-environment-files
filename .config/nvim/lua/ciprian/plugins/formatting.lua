return {
  "stevearc/conform.nvim", -- Plugin name

  -- Events that trigger the plugin (BufReadPre and BufNewFile)
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    -- Import the 'conform' module
    local conform = require("conform")

    -- Setup 'conform' with formatting options
    conform.setup({
      formatters_by_ft = {
        -- Define formatting tools for specific file types
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true, -- Use Language Server Protocol (LSP) for formatting if available
        async = false, -- Disable asynchronous formatting
        timeout_ms = 1000, -- Timeout for formatting in milliseconds
      },
    })

    -- Define a key mapping to trigger formatting
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true, -- Use LSP for formatting if available
        async = false, -- Disable asynchronous formatting
        timeout_ms = 1000, -- Timeout for formatting in milliseconds
      })
    end, { desc = "format file or range (in visual mode)" })
  end,
}

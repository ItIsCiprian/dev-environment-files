-- Configuration for 'conform.nvim', a code formatter plugin for Neovim.
-- It sets up automatic formatting for multiple file types and provides
-- an option to format on save or manually via a keymap.
return {
  "stevearc/conform.nvim",  -- Plugin identifier.
  lazy = true,  -- Enables lazy loading to improve startup time.
  event = { "BufReadPre", "BufNewFile" },  -- Plugin loads on opening or creating files.

  -- The 'config' function contains all the setup and configuration for the plugin.
  config = function()
    local conform = require("conform")

    -- Setup formatters for specific file types using 'prettier' for most web technologies
    -- and 'stylua' for Lua, 'isort' and 'black' for Python.
    conform.setup({
      -- Map file types (ft) to their respective formatters.
      formatters_by_ft = {
        javascript = { "prettier" },         -- JavaScript files
        typescript = { "prettier" },         -- TypeScript files
        javascriptreact = { "prettier" },    -- React JS files
        typescriptreact = { "prettier" },    -- React TS files
        svelte = { "prettier" },             -- Svelte files
        css = { "prettier" },                -- CSS files
        html = { "prettier" },               -- HTML files
        json = { "prettier" },               -- JSON files
        yaml = { "prettier" },               -- YAML files
        markdown = { "prettier" },           -- Markdown files
        graphql = { "prettier" },            -- GraphQL files
        lua = { "stylua" },                  -- Lua files
        python = { "isort", "black" },       -- Python files
      },

      -- Configure automatic formatting on file save.
      format_on_save = {
        lsp_fallback = true,   -- Use LSP as a fallback formatter.
        async = false,         -- Formatting is done synchronously.
        timeout_ms = 1000,     -- Maximum time (in milliseconds) to wait for the formatting to complete.
      },
    })

    -- Key mapping for manually triggering formatting.
    -- Works in normal and visual modes, bound to '<leader>mp'.
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        -- Inherits settings from 'format_on_save' for consistency.
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}

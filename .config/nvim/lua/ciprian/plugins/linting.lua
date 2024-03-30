-- Configuration for the 'nvim-lint' plugin, which provides asynchronous linting in Neovim.
return {
  "mfussenegger/nvim-lint",
  -- The plugin is loaded lazily to improve startup time, only initializing when needed.
  lazy = true,
  -- The plugin is activated upon opening or creating files, to ensure linting is available immediately.
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configuration of linters by filetype.
    -- This maps various filetypes to their respective linters, ensuring appropriate tools are used.
    lint.linters_by_ft = {
      javascript = { "eslint_d" },        -- JavaScript files use 'eslint_d'.
      typescript = { "eslint_d" },        -- TypeScript files use 'eslint_d'.
      javascriptreact = { "eslint_d" },   -- React (JSX) files use 'eslint_d'.
      typescriptreact = { "eslint_d" },   -- React (TSX) files use 'eslint_d'.
      svelte = { "eslint_d" },            -- Svelte files use 'eslint_d'.
      python = { "pylint" },              -- Python files use 'pylint'.
    }

    -- Creates an augroup for linting actions to manage autocmds neatly.
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Setup autocmds to trigger linting at specific events.
    -- Linting occurs when entering a buffer, after writing to a buffer, or leaving insert mode.
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()  -- Attempts to lint the current buffer using the configured linters.
      end,
    })

    -- Keymap to manually trigger linting of the current file.
    -- This provides a quick way for the user to re-lint the file on demand.
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for the current file" })
  end,
}

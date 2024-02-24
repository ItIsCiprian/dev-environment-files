return {
  {
    "catppuccin/nvim", -- Plugin identifier for Catppuccin theme for Neovim
    config = function()
      -- Setup function to configure the Catppuccin theme
      require("catppuccin").setup({
        integrations = {
          -- Enabling various integrations with other plugins and features
          cmp = true, -- Completion plugin integration
          gitsigns = true, -- Git integration for showing signs in the gutter
          harpoon = true, -- Project navigation tool
          illuminate = true, -- Highlight other uses of the current word under the cursor
          indent_blankline = {
            enabled = false, -- Disabling indentation guides by default
            scope_color = "sapphire", -- Color for the scope indicator
            colored_indent_levels = false, -- Disable coloring indent levels differently
          },
          mason = true, -- Automatically manage external editor tooling
          native_lsp = { enabled = true }, -- Enable native LSP client integration
          notify = true, -- Notification manager integration
          nvimtree = true, -- File explorer integration
          neotree = true, -- Another file explorer integration, alternative to NvimTree
          symbols_outline = true, -- Symbols outline for easy navigation
          telescope = true, -- Fuzzy finder integration
          treesitter = true, -- Syntax highlighting via Treesitter
          treesitter_context = true, -- Show code context based on Treesitter
        },
      })

      -- Setting the colorscheme to Catppuccin Macchiato
      vim.cmd.colorscheme("catppuccin-macchiato")

      -- Workaround for a known issue with LSP highlights
      -- Temporarily hide all semantic highlights until the issue is resolved
      -- More details at https://github.com/catppuccin/nvim/issues/480
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end
    end,
  },
}

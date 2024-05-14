-- Configuration for the Catppuccin theme in Neovim
return {
  {
    "catppuccin/nvim", -- Theme plugin identifier

    -- The 'config' function contains setup instructions for the Catppuccin theme
    config = function()
      -- Initialize the Catppuccin theme with specific configurations
      require("catppuccin").setup({
        -- Configuration for integrating with other Neovim plugins and features
        integrations = {
          cmp = true,                 -- Enable integration with completion plugin
          gitsigns = true,            -- Enable Git signs in the gutter
          harpoon = true,             -- Enable integration with Harpoon for project navigation
          illuminate = true,          -- Enable highlighting of word occurrences
          indent_blankline = {       -- Configuration for indentation guides
            enabled = false,          -- Disable indentation guides by default
            scope_color = "sapphire", -- Set color for scope indicators
            colored_indent_levels = false, -- Disable coloring for different indent levels
          },
          mason = true,               -- Enable Mason for managing external tooling
          native_lsp = {              -- Enable integration with native LSP client
            enabled = true,
          },
          notify = true,              -- Enable integration with notification manager
          nvimtree = true,            -- Enable integration with NvimTree file explorer
          neotree = true,             -- Enable integration with NeoTree file explorer
          symbols_outline = true,     -- Enable symbols outline for navigation
          telescope = true,           -- Enable integration with Telescope fuzzy finder
          treesitter = true,          -- Enable syntax highlighting with Treesitter
          treesitter_context = true,  -- Enable Treesitter-based code context display
        },
      })

      -- Apply the Catppuccin Mocha colorscheme
      vim.cmd("colorscheme catppuccin-mocha")

      -- Temporary fix for an LSP highlights issue with the Catppuccin theme
      -- This loop clears all semantic highlight groups as a workaround
      -- Refer to https://github.com/catppuccin/nvim/issues/480 for more details
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {}) -- Clear the highlight group
      end
    end,
  },
}

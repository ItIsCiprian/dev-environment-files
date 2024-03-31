-- nvim-cmp setup for autocompletion in Neovim
-- This configuration includes completion sources for buffer text, file paths,
-- snippets, and more, with additional visual enhancements provided by lspkind.
return {
  "hrsh7th/nvim-cmp",
  -- Trigger the setup when entering insert mode to enhance performance.
  event = "InsertEnter",
  -- Define the dependencies that nvim-cmp will use as completion sources.
  dependencies = {
    "hrsh7th/cmp-buffer",       -- Completion source for buffer text.
    "hrsh7th/cmp-path",         -- Completion source for filesystem paths.
    "onsails/lspkind.nvim",     -- Provides VS Code-like icons for completions.
    "L3MON4D3/LuaSnip",         -- Snippet engine required for many completions.
    "saadparwaiz1/cmp_luasnip", -- Allows for LuaSnip integration with nvim-cmp.
    "rafamadriz/friendly-snippets", -- A collection of snippets for many languages.
  },
  config = function()
    -- Import required modules for completion and snippets.
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Lazy load snippets from friendly-snippets plugin.
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Set Vim options for better completion experience.
    vim.opt.completeopt = "menu,menuone,noselect"

    -- Setup the completion framework.
    cmp.setup({
      -- Configure snippet expansion.
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Function to expand the selected snippet.
        end,
      },
      -- Define key mappings for various completion actions.
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Navigate to previous suggestion.
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Navigate to next suggestion.
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),    -- Scroll up in the documentation.
        ["<C-f>"] = cmp.mapping.scroll_docs(4),     -- Scroll down in the documentation.
        ["<C-Space>"] = cmp.mapping.complete(),     -- Trigger the completion window.
        ["<C-e>"] = cmp.mapping.abort(),            -- Abort/close the completion window.
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection.
      }),
      -- Specify the order and priority of completion sources.
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Source from Language Server Protocol.
        { name = "luasnip" },  -- Source from LuaSnip.
        { name = "buffer" },   -- Source from current buffer text.
        { name = "path" },     -- Source for filesystem paths.
      }),
      -- Customize the appearance of completion items.
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50, -- Maximum width of icons and text before truncating.
          ellipsis_char = "...", -- Characters to represent truncated text.
        }),
      },
    })
  end,
}

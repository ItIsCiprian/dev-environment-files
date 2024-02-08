-- This Lua configuration file sets up the gitsigns.nvim plugin for use with lazy.nvim.
-- gitsigns.nvim provides git integration, displaying change indicators and performing git operations within Neovim.

-- Define a configuration table for gitsigns setup
local config = {
  -- Configuration for the gitsigns plugin
  setup = function()
    require("gitsigns").setup({
      -- Define the text symbols for various git changes
      signs = {
        add = { text = "│" }, -- Symbol for added lines
        change = { text = "│" }, -- Symbol for changed lines
        delete = { text = "_" }, -- Symbol for deleted lines
        topdelete = { text = "‾" }, -- Symbol for the top of a block of deleted lines
        changedelete = { text = "~" }, -- Symbol for changed lines that were also deleted
        untracked = { text = "┆" }, -- Symbol for untracked files
      },
      signcolumn = true, -- Show the sign column by default
      numhl = false, -- Disable line number highlighting
      linehl = false, -- Disable line highlighting
      word_diff = false, -- Disable word diff
      watch_gitdir = {
        follow_files = true, -- Enable following files when moved within the git directory
      },
      auto_attach = true, -- Automatically attach to buffers
      attach_to_untracked = true, -- Attach to untracked files
      current_line_blame = false, -- Disable current line blame by default
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- Position of the virtual text
        delay = 1000, -- Delay before the virtual text appears
        ignore_whitespace = false, -- Blame considering whitespace
        virt_text_priority = 100, -- Priority of the virtual text
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100, -- Debounce time for updating signs
      status_formatter = nil, -- Use the default status formatter
      max_file_length = 40000, -- Disable for files longer than this number of lines
      preview_config = {
        -- Configuration for the preview window
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false, -- Disable yadm integration
      },
      -- The 'on_attach' function configures key mappings for gitsigns within a specific buffer
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, lhs, rhs, opts)
          opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Key mappings for navigation and actions related to git changes
        map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
        map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
        -- Additional mappings for staging, resetting, previewing hunks, etc.
        -- ...
      end,
    })
  end,
}

-- Use lazy.nvim to load gitsigns.nvim with the defined configuration
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = config.setup,
}

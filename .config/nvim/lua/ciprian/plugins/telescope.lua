-- Configuration for the telescope.nvim plugin
return {
  "nvim-telescope/telescope.nvim",  -- Plugin identifier
  branch = "0.1.x",                 -- Specify the plugin version branch
  dependencies = {                  -- List of plugin dependencies
    "nvim-lua/plenary.nvim",                          -- Utility functions for Neovim
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FZF-native integration for faster searching
    "nvim-tree/nvim-web-devicons",                    -- File icons
    "folke/todo-comments.nvim",                       -- Plugin for highlighting TODO comments
  },
  config = function()               -- Configuration function for the plugin
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")                -- Trouble plugin for diagnostics
    local trouble_telescope = require("trouble.providers.telescope")

    -- Custom actions using telescope's transform_mod
    local custom_actions = transform_mod({
      -- Function to toggle trouble's quickfix list
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    -- Setup telescope with default settings and key mappings
    telescope.setup({
      defaults = {
        path_display = { "smart" },                   -- Smart path display
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,    -- Map Ctrl-k to move up in the results
            ["<C-j>"] = actions.move_selection_next,        -- Map Ctrl-j to move down in the results
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist, -- Map Ctrl-q to send selection to quickfix list and open trouble
            ["<C-t>"] = trouble_telescope.smart_open_with_trouble, -- Map Ctrl-t to open with trouble using telescope
          },
        },
      },
    })

    telescope.load_extension("fzf")  -- Load the FZF extension for fuzzy finding

    -- Define key mappings for various telescope functions
    local keymap = vim.keymap
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in current working directory" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in current working directory" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in current working directory" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "

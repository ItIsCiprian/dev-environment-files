-- Configuration for the 'trouble.nvim' plugin, which provides an enhanced UI to display diagnostics, 
-- errors, and todo comments within Neovim. This setup includes dependencies and key mappings for easy access.
return {
  "folke/trouble.nvim",  -- Plugin identifier for 'trouble.nvim'.

  -- Specifies plugins that 'trouble.nvim' requires to function properly.
  dependencies = {
    "nvim-tree/nvim-web-devicons",  -- Adds file type icons.
    "folke/todo-comments.nvim",     -- Integrates todo comments into 'trouble.nvim'.
  },

  -- Key mappings to interact with 'trouble.nvim' functionality directly from the keyboard.
  keys = {
    -- Toggle the trouble list panel. This is a general overview of diagnostics and todos.
    { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
    
    -- Open the workspace diagnostics in the trouble panel. This shows errors and warnings across the entire workspace.
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
    
    -- Open document diagnostics. Focuses on errors and warnings in the current document.
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
    
    -- Open the quickfix list in the trouble panel. Useful for navigating through a list of search results, compiler errors, etc.
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
    
    -- Open the location list. Similar to quickfix, but specific to the current window.
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
    
    -- Open a list of todos in the trouble panel, extracted from comments within your code.
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
  },
}

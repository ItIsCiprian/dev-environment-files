-- Vim plugin for maximizing and minimizing a split window
return {
  "szw/vim-maximizer",  -- The plugin identifier for vim-maximizer

  -- Key bindings for the plugin
  keys = {
    -- Leader key followed by 'sm' to toggle split window maximization
    {
      "<leader>sm",  -- The key combination to trigger the command
      "<cmd>MaximizerToggle<CR>",  -- The Vim command to maximize or minimize the current split
      { desc = "Maximize/minimize a split" }  -- Description for the key mapping
    },
  },
}

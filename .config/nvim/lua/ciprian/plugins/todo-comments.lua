-- Plugin configuration for 'todo-comments.nvim', a Neovim plugin that highlights and manages TODO comments.
return {
  "folke/todo-comments.nvim",             -- Plugin identifier
  event = { "BufReadPre", "BufNewFile" }, -- Load the plugin on reading a buffer or creating a new file
  dependencies = { "nvim-lua/plenary.nvim" }, -- Dependency required by the plugin
  
  -- Configuration function for setting up the plugin
  config = function()
    -- Require the todo-comments plugin
    local todo_comments = require("todo-comments")

    -- Setup keymaps for navigation between TODO comments
    local keymap = vim.keymap  -- Alias for vim's keymap utility for easier access

    -- Keymap for navigating to the next TODO comment
    keymap.set("n", "]t", function()
      todo_comments.jump_next()  -- Jump to the next TODO comment
    end, { desc = "Next todo comment" }) -- Description for which key does what

    -- Keymap for navigating to the previous TODO comment
    keymap.set("n", "[t", function()
      todo_comments.jump_prev()  -- Jump to the previous TODO comment
    end, { desc = "Previous todo comment" }) -- Description for which key does what

    -- Initialize the todo-comments with default or specified settings
    todo_comments.setup()
  end,
}

-- Plugin configuration for testing within Neovim.
-- This setup includes 'vim-test' for running tests and uses 'vimux' for displaying test results in a tmux pane.

return {
  {
    -- Main test plugin for integrating testing tools with Vim, allowing for running tests from within the editor.
    "vim-test/vim-test",

    -- Specifies dependencies for 'vim-test'. 'vimux' is used to run test commands in a tmux pane.
    dependencies = { "preservim/vimux" },

    -- Configuration setup for vim-test using vimux as the test running strategy.
    config = function()
      -- Key mappings for running different types of test commands.
      -- <leader>t runs the nearest test to the cursor.
      vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
      -- <leader>T runs tests for the current file.
      vim.keymap.set("n", "<leader>T", ":TestFile<CR>")
      -- <leader>a runs the entire test suite.
      vim.keymap.set("n", "<leader>a", ":TestSuite<CR>")
      -- <leader>l runs the last run test command again.
      vim.keymap.set("n", "<leader>l", ":TestLast<CR>")
      -- <leader>g navigates to the test file related to the current file.
      vim.keymap.set("n", "<leader>g", ":TestVisit<CR>")
      
      -- Set 'vimux' as the strategy for running tests, integrating tightly with tmux for output.
      vim.cmd("let test#strategy = 'vimux'")
    end,
  },
}

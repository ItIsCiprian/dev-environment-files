-- Returns a table with the configuration for the 'dressing.nvim' plugin.
-- This configuration is used by the Packer Neovim plugin manager to handle plugin loading and setup.
return {
  -- Specifies the GitHub repository of the plugin. In this case, 'dressing.nvim' by 'stevearc'.
  "stevearc/dressing.nvim",

  -- 'event' specifies the Neovim event that triggers the loading of this plugin.
  -- Here, 'VeryLazy' is a custom or placeholder event name.
  -- Note: If 'VeryLazy' is intended as an actual event, ensure it's correctly implemented or replace it with a valid Neovim event.
  -- Common events include 'BufRead', 'BufNewFile', etc., which trigger the plugin to load on specific actions.
  event = "VeryLazy",
}

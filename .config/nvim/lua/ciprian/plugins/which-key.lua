-- Plugin configuration for 'folke/which-key.nvim'.
-- This plugin is loaded with a custom event labeled "VeryLazy".
-- Configuration applies to initializing settings specific to Neovim's handling of key timeouts.
return {
  "folke/which-key.nvim",  -- Specifies the GitHub repository of the plugin.
  
  event = "VeryLazy",  -- Custom event name used to defer loading the plugin.
  
  -- Initializes settings immediately before the plugin is loaded.
  init = function()
    vim.o.timeout = true  -- Enables Neovim's option to detect key sequence timeout.
    vim.o.timeoutlen = 500  -- Sets the length of time to wait for a mapped sequence to complete (in milliseconds).
  end,
  
  opts = {
    -- Configuration options for 'which-key.nvim'.
    -- Place your custom settings within this table.
    -- If left empty, default settings of the plugin are used.
    -- Refer to the official 'which-key.nvim' documentation for configuration details.
  },
}

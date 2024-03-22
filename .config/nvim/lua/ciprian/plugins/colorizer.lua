-- Configuration for the nvim-colorizer plugin.
-- This plugin provides color highlighting in Neovim, showing the actual color of hexadecimal,
-- RGB, RGBA, and other color codes in the editor.

return {
  -- The GitHub repository of the nvim-colorizer.lua plugin for Neovim.
  "NvChad/nvim-colorizer.lua",

  -- The 'event' field specifies when the plugin should be loaded.
  -- In this case, it loads before reading a buffer's content ('BufReadPre') 
  -- and when creating a new file ('BufNewFile').
  -- These events help in optimizing Neovim's startup time by loading the plugin
  -- only when it's likely to be needed.
  event = { "BufReadPre", "BufNewFile" },

  -- The 'config' field indicates whether this plugin has a separate configuration
  -- that should be applied upon loading. Setting it to 'true' implies that there
  -- is a configuration that should be executed to customize or set up the plugin
  -- after it's loaded. This configuration should be defined elsewhere in your Neovim setup.
  config = true,
}

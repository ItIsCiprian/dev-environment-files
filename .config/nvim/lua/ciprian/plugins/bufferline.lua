-- Configuration for the bufferline plugin.
-- This plugin enhances the buffer line at the top of Neovim windows,
-- allowing for easier navigation between buffers.
return {
  -- The GitHub repository of the bufferline plugin for Neovim.
  "akinsho/bufferline.nvim",

  -- Dependencies required by bufferline.nvim.
  -- These are additional plugins or libraries that bufferline.nvim needs to function properly.
  dependencies = {
    -- nvim-web-devicons is used to add filetype icons to the bufferline.
    -- It enhances the visual presentation of different files/buffers.
    "nvim-tree/nvim-web-devicons"
  },

  -- The version of the bufferline plugin to be used.
  -- Here, "*" means the latest version.
  version = "*",

  -- Configuration options for bufferline.nvim.
  opts = {
    -- The 'options' table contains various settings to customize the behavior and appearance of the bufferline.
    options = {
      -- Set the mode to 'tabs' to mimic the behavior of tabbed interfaces in other editors.
      mode = "tabs",

      -- Customize the style of the separators between tabs/buffers.
      -- 'slant' adds a slanted line as a separator, providing a unique visual style.
      separator_style = "slant",
    },
  },
}
